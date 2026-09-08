# 새 노트북 · 새 Claude 계정 이전 가이드

2026-07-27, JADEKANG 개인 계정으로 이전 작업 중 작성.

## 요약
- git repo 4개를 JADEKANG 개인 계정으로 백업/이전 완료
- Claude.ai 계정에 귀속된 것(Artifact, MCP 커넥터)은 새 계정 로그인 후 재작업 필요
- 로컬 자동화(launchd)와 시크릿(Slack webhook)은 git으로 안 옮겨지므로 사람이 직접 챙겨야 함

## 1. 백업된 저장소 (전부 JADEKANG 소유, private repo)

| 원래 위치 | 새 repo | 내용 |
|---|---|---|
| `~/.claude` | `github.com/JADEKANG/26-claude-archive` | 메모리(현재+레거시), CLAUDE.md, settings.json, hooks `*.py`, 스킬 전체, jtech 프롬프트/스크립트, launchd plist 사본, eo-realvalley 편집노트 |
| `~/english-study` | `github.com/JADEKANG/english-study` | Tyler 점심 영어 퀴즈앱 소스 (`vocab.md`, `build_app.py`, `quiz.html`) |
| `~/english-study-bot` | `github.com/JADEKANG/english-study-bot` | Tyler 슬랙봇 소스 (Vercel 배포용, 첫 커밋) |
| `~/claude` | `github.com/JADEKANG/yjk` | 3월 구 작업폴더 — Drew Bent 쇼츠, 야놀자 자막, 초기 EO/TTM 분석 |

## 2. 의도적으로 제외한 것 (재설치·재로그인으로 자동 복구됨)

- **`.claude.json`** — 계정 인증 토큰(oauthAccount, userID, machineID 등). 새 계정으로 처음 로그인하면 자동 생성됨. 절대 옛 파일을 그대로 옮기지 말 것.
- **`plugins/cache/`, `plugins/marketplaces/`** (88M) — 재설치 가능한 캐시. OMC 플러그인 재설치로 복구.
- **OMC 내장 에이전트** (analyst/planner/architect/executor 등) — 파일로 저장된 게 아니라 OMC 플러그인 패키지 안에 내장. 커스텀 에이전트는 없음(`~/.claude/agents/` 비어있음). 플러그인만 재설치하면 전부 자동 복구, 손댈 것 없음.

## 3. git에 없어서 직접 옮겨야 하는 것

- **`~/.claude/jtech/.webhook_url`** — 실제 Slack Incoming Webhook URL. GitHub push protection이 실제로 커밋을 막아서 `jtech/prompt.txt`에서 값을 빼고 이 로컬 파일을 읽게 바꿔놨음(gitignore됨). 새 노트북에선 이 파일을 다시 만들어야 함 — 안전한 채널(암호관리자, AirDrop)로 값을 옮기거나, Slack App 설정에서 새로 발급.
- **Vercel 환경변수** (`ANTHROPIC_API_KEY`, `SLACK_BOT_TOKEN`, `SLACK_SIGNING_SECRET`, `CRON_SECRET`) — english-study-bot용. 로컬엔 값이 없고 Vercel 대시보드에만 있음(`.env` 파일 자체가 로컬에 없었음). Vercel 프로젝트가 GitHub OAuth로 `yjk-claude` 계정과 연동돼 있다면, 자동배포 연결을 `JADEKANG/english-study-bot`으로 다시 걸어야 함 — Vercel 대시보드에서 직접 확인 필요.

## 4. 새 노트북 셋업 순서

1. Claude Code 설치
2. `gh auth login` → **JADEKANG** 계정으로 인증 (브라우저 device code 플로우, 타임아웃 있으니 완전히 별도 터미널에서 빠르게 완료할 것)
3. 필요한 repo clone:
   ```bash
   git clone https://github.com/JADEKANG/26-claude-archive.git ~/.claude
   git clone https://github.com/JADEKANG/english-study.git ~/english-study
   git clone https://github.com/JADEKANG/english-study-bot.git ~/english-study-bot
   git clone https://github.com/JADEKANG/yjk.git ~/claude   # 필요할 때만
   ```
4. **macOS 사용자명이 지금(`yoojinkang`)과 다르면**: `~/.claude/projects/-Users-yoojinkang/memory/`를 새 경로 인코딩(`~/.claude/projects/-Users-<새사용자명>/memory/`)에 맞게 폴더명 변경. 같으면 자동 인식.
5. Claude Code를 새 계정으로 로그인 (`.claude.json` 새로 생성됨)
6. OMC 플러그인 재설치:
   ```
   /plugin marketplace add Yeachan-Heo/oh-my-claudecode
   /plugin install oh-my-claudecode@omc
   ```
7. jtech 웹훅 복구: `~/.claude/jtech/.webhook_url` 파일을 만들고 실제 URL 붙여넣기 (한 줄, 개행 없이)
8. launchd 자동화 재등록:
   ```bash
   cp ~/.claude/launchd/net.eoeoeo.jtech.plist ~/Library/LaunchAgents/
   cp ~/.claude/launchd/net.eoeoeo.hook-health.plist ~/Library/LaunchAgents/
   launchctl load ~/Library/LaunchAgents/net.eoeoeo.jtech.plist
   launchctl load ~/Library/LaunchAgents/net.eoeoeo.hook-health.plist
   ```
9. Claude.ai 설정에서 MCP 커넥터 재연동: Slack, Notion, Google Calendar, Gmail, Google Drive 등 — 전부 이전 계정에 연결돼 있던 것이라 새 계정에서 하나씩 다시 연결해야 함
10. Tyler 퀴즈 앱 Artifact 재배포 — Claude에게 "퀴즈앱 다시 퍼블리시해줘"라고 하면 `~/english-study/quiz.html` 기준으로 새 Artifact 생성 가능. **URL이 바뀌므로** 노션 캘린더 알림(구글캘린더 event id `7tg5d9a0okn5jb2hat2v4h11ms`)의 링크도 새 URL로 갱신 필요.

## 5. 판단 보류 — 이번에 손 안 댄 것

- **`~/.claude/eo-thinking-mode/`** (628K, TTM 게스트 후보·리서치) — 원래부터 `.gitignore`에 "로컬 only"로 명시돼 있던 폴더. 이번 이전 작업에서 그 결정을 그대로 존중해서 안 옮김. 계정/노트북이 사라지면 이 폴더 내용도 같이 사라짐 — 백업 필요하면 알려줄 것.
- **`~/eo-interview-ai/`** — 별도 프로젝트, git 관리 안 되고 있음. 영어 연습과 무관해 보여 이번엔 조사만 하고 안 건드림.

## 6. 계정 끊기 전 마지막 체크리스트

- [ ] 4개 repo가 새 환경에서 정상적으로 clone되는지 실제로 한 번 테스트
- [ ] jtech webhook URL 값을 암호관리자 등에 별도로 적어둠
- [ ] Vercel 대시보드 로그인이 GitHub(`yjk-claude`) 계정에 걸려있는지 확인 — 그렇다면 Vercel 계정 자체도 이전 필요
- [ ] eo-thinking-mode 백업 여부 결정
