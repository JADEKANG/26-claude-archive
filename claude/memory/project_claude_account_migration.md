---
name: project-claude-account-migration
description: "Claude 계정(JADEKANG 개인 계정으로 전환) + 노트북 이전 작업 — 4개 git repo 이전 완료, 남은 것 정리"
metadata: 
  node_type: memory
  type: project
  originSessionId: 65f29490-135e-4044-bad4-294cf2c852df
  modified: 2026-07-27T14:07:19.157Z
---

기존 GitHub/Claude 계정과 노트북을 정리하고 JADEKANG 개인 계정 + 새 노트북으로 옮기는 작업.

**Why:** 기존 GitHub 계정(`yjk-claude`)이 연결된 구글 계정이 사라질 예정 → 그 계정에 걸린 모든 repo/서비스가 함께 사라질 위험. Claude Code 메모리(`~/.claude`)는 로컬 파일 기반이라 계정/구독과는 무관하지만, git으로 백업해두지 않으면 노트북을 버릴 때 같이 사라짐.

**진행 상태 (2026-07-27):**
- ✅ 완료 — 4개 repo 전부 JADEKANG 개인 GitHub(private)로 이전/백업:
  - `~/.claude` → `github.com/JADEKANG/26-claude-archive` (메모리·CLAUDE.md·settings.json·hooks `*.py`·스킬 전체·jtech 프롬프트/스크립트·launchd plist 사본·eo-realvalley 편집노트)
  - `~/english-study` → `github.com/JADEKANG/english-study` (Tyler 퀴즈앱 소스)
  - `~/english-study-bot` → `github.com/JADEKANG/english-study-bot` (슬랙봇 소스, 이번에 처음 커밋됨 — 이전엔 git 자체가 없었음)
  - `~/claude` → `github.com/JADEKANG/yjk` (3월 구 작업폴더 — Drew Bent 쇼츠, 야놀자 자막, 초기 EO/TTM 분석)
  - 상세 절차·체크리스트는 `~/.claude/MIGRATION.md`(repo에 커밋됨, 새 노트북에서 clone하면 같이 따라옴)

**미해결 — 다음에 이어갈 것 (우선순위 순):**
1. **영어학습 클라우드 루틴 2개**(아침 표현 등, [[reference_jtech_routine]]에 ID 있음)의 설정이 옛 repo URL(`yjk-claude/english-study`)을 참조 중일 가능성 → JADEKANG repo URL로 갱신 필요. [[project_claude_optimization]] 3번 항목과 동일 이슈.
2. `eo-thinking-mode/`(628K, TTM 게스트 리서치)는 원래 ".gitignore에 로컬 only"였던 결정을 존중해서 이번엔 안 옮김 — 옮길지 결정 필요.
3. Vercel 대시보드가 GitHub `yjk-claude`로 로그인돼 있으면 Vercel 계정 자체도 이전 필요 (Claude가 접근 불가해서 미확인).
4. jtech Slack webhook URL은 시크릿이라 git에 못 넣음(GitHub push protection이 실제로 커밋 차단함) — `~/.claude/jtech/.webhook_url`은 gitignore됨, 새 노트북에서 직접 값을 옮겨야 함.
5. 새 노트북에서 할 일: OMC 플러그인 재설치, Claude.ai MCP 커넥터(Slack/Notion/Google Calendar 등 — 전부 이전 계정에 연결돼 있던 것) 재연동, Tyler 퀴즈앱 Artifact 재배포(URL 바뀜 → 노션 캘린더 알림 링크도 갱신).

**How to apply:** "이전 이어서" 또는 새 노트북 셋업 얘기 나오면 `~/.claude/MIGRATION.md`를 먼저 열어서 체크리스트 기준으로 진행.
