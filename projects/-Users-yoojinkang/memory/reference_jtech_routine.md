---
name: reference_jtech_routine
description: 매일 아침 테크뉴스 브리프를 슬랙 채널에 웹훅(봇)으로 보내는 자동화 — 2026-07-02부터 로컬 launchd 방식 (클라우드 루틴 폐기)
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4c6a20a8-0f2d-43a4-bb99-91ce5c689e13
---

`jtech` 데일리 브리프 자동화. 3일 연속 장애 끝에 **2026-07-02 클라우드 루틴을 버리고 로컬 launchd로 전환**.

## ★현재 구성 (2026-07-02 확정 — 로컬 launchd)
- **launchd 에이전트**: `net.eoeoeo.jtech` (`~/Library/LaunchAgents/net.eoeoeo.jtech.plist`), 매일 09:00 KST 실행. Mac이 자고 있었으면 **깨어난 직후 자동 실행**(launchd catch-up).
- **실행 스크립트**: `~/.claude/jtech/run-jtech.sh` — `claude -p`(헤드리스, allowedTools=Bash,Read,Write,WebFetch,WebSearch)로 `~/.claude/jtech/prompt.txt`의 브리프 프롬프트 실행 → 웹훅 POST.
- **중복 방지**: `~/.claude/jtech/last_success`에 성공 날짜 기록, 같은 날 재실행 시 스킵. (여러 번 깨어나도 하루 1회.)
- **로그**: `~/.claude/jtech/jtech.log` — 안 오면 여기부터 확인. `launchd fired` / `SUCCESS` / `FAILED` 기록됨.
- **발송처**: #jtechnews-daily-update (ID `C0BDE42CFNV`), Incoming Webhook → 봇 "Tecky"(B0BDABTV9DL). 웹훅 URL은 prompt.txt·스크립트 안에 있음(비밀값). 첫 줄 `<@U0A6U8EFX52>` 멘션으로 푸시 발생.
- **검증 완료 (07-02)**: launchd→스크립트 기동 OK, 중복스킵 OK, `claude -p` 헤드리스 OK, 이 Mac→웹훅 발송 OK(당일 브리프 실발송으로 실증).
- **한계**: Mac이 하루 종일 꺼져 있으면 그날은 못 보냄(다음 부팅 때 그날 자로 발송됨).

## 장애 이력: 07-03 "claude CLI not found"
- 07-03 09:07 launchd 발화했으나 실패 — claude가 `/opt/homebrew/bin/claude`(homebrew npm 글로벌)에 있는데 스크립트 폴백이 `~/.local/bin/claude`뿐이었음. launchd PATH엔 homebrew 없음.
- **수정 완료**: run-jtech.sh가 후보 경로(`command -v` → /opt/homebrew/bin → ~/.local/bin → ~/.claude/local → /usr/local/bin) 순회 탐색 + PATH 보강하도록 변경. 11:33 재실행 SUCCESS 실증.
- 교훈: claude CLI 재설치/설치경로 변경 시 이 스크립트 깨질 수 있음 → 로그에 "claude CLI not found" 뜨면 `which claude`로 새 경로 확인 후 후보 목록에 추가.
- **07-03 추가 검증·강화**: ① 임시 11:42 스케줄로 launchd 자동발화→발송 전 구간 e2e 실증(11:42:03 fired → 11:49:58 SUCCESS, 실제 도착 확인. 테스트 후 plist 09:00만으로 원복). ② **실패 시 슬랙 알림 추가** — FAILED 브랜치에서 같은 웹훅으로 "⚠️ 발송 실패 (exit N) + 마지막 로그" 경고 발송(웹훅 URL은 prompt.txt에서 grep, python json.dumps 사용). 알림 경로도 실발송 테스트 완료(webhook response: ok). 이제 조용한 실패 없음 — 아침에 브리프도 알림도 없으면 "launchd 미발화(Mac 꺼짐)"로 좁혀짐.

## 장애 이력: 07-05 API 일시 장애 → 재시도 루프 추가
- 07-05 09:00 발화했으나 `claude -p`가 Anthropic API 일시 장애(`Connection closed mid-response`)로 exit 1 → 실패 알림 발송됨. 20:30 수동 kickstart로 당일 발송 성공.
- **수정 완료**: run-jtech.sh에 자가 복구 루프 — 최대 3회 시도, 실패 간 5분 대기. 3회 전멸 시에만 실패 알림. 이제 알림이 왔다 = 15분 넘게 지속된 진짜 문제.
- 샌드박스로 실패/성공 경로 검증 완료(실전 첫 회차는 07-06 09:00). 상세: `~/.claude/jtech/incident-2026-07-05.md`
- 참고: 실패한 날은 last_success 스탬프가 안 찍히므로 수동 재실행 시 `rm last_success` 불필요, kickstart만 하면 됨.

## 트러블슈팅 순서 (안 왔을 때)
1. `cat ~/.claude/jtech/jtech.log` — fired 기록 있는지, FAILED인지.
2. `launchctl list | grep jtech` — 에이전트 로드돼 있는지. 없으면 `launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/net.eoeoeo.jtech.plist`.
3. 수동 발송: `rm ~/.claude/jtech/last_success && launchctl kickstart gui/$(id -u)/net.eoeoeo.jtech`.

## 클라우드 루틴을 버린 이유 (2026-07-02 판정)
- v2 루틴(`trig_01PQJnFHc3nc9HkpwPRnrM27`)은 **단 한 번도 전달 성공한 적 없음**. cron 발화·수동 실행 모두 session_id는 발급되는데 세션이 실제로 안 돌아 아무것도 안 옴. 설정을 표준형(model 명시, 표준 allowed_tools, session_id 필드)으로 고치고 모델을 sonnet-4-6으로 바꿔도 동일.
- **한 줄 웹훅 POST만 하는 초미니 테스트 루틴**(http_api 생성)조차 실행 안 됨 → 루틴 설정 문제가 아니라 플랫폼 실행 경로 문제. 세션 로그를 볼 수 없어 디버깅 불가 → 관측 가능한 로컬로 전환.
- 두 루틴 모두 `enabled:false` 처리함. **웹 routines 페이지에서 삭제 권장**: `trig_01PQJnFHc3nc9HkpwPRnrM27`(JTech v2), `trig_01Fx9GpPbhwNYxVAq1z371Dc`(pipeline test temp). 삭제는 API 불가, 웹에서만.
- (참고) 영어학습 루틴 2개는 클라우드에서 계속 정상 — 클라우드 루틴 전체가 죽은 건 아님. JTech만 이례적으로 계속 실패.

## 장애 3일 연대기 (교훈)
- 06-30: 구 루틴이 heredoc 손 이스케이프로 빈 글 → Slack MCP 폴백으로 자기 DM 발송. → 교훈: 웹훅 JSON은 반드시 python json.dumps.
- 07-01: 옛 루틴 3개 삭제 + v2 신설. 그러나 v2 설정이 비표준(model 누락, `preset:default`/`Tmux` 등 이상한 allowed_tools, 이벤트 session_id 누락+isSynthetic)이었고 수동 실행 검증도 실패한 채 방치.
- 07-02: cron 발화했지만 미전달 → 설정 교정 2회+미니테스트 모두 실패 → **로컬 전환 + 당일 브리프는 세션에서 직접 작성·발송**(09:48 도착).
- ★교훈: 예약 자동화는 만든 날 **실제 전달까지 e2e 검증** 전엔 끝난 게 아님. 검증 불가한 경로(클라우드 세션)보다 로그 보이는 로컬이 낫다.

## 포맷 (제이드 피드백 누적 반영 — prompt.txt에 반영돼 있음)
- 첫 줄 `<@U0A6U8EFX52>` 멘션. 주제(카테고리)별 2~4개 분류(출처별 X), `🔷 *카테고리*`.
- 스토리: 해시태그 → *헤드라인* → 📌 등장인물(`>` 인용블록, 입문자 모를 것만, 유명 기업 생략) → 한 줄 요약 → `• 핵심/임팩트/주목`(구체 앵커) → 🔗 출처.
- Slack mrkdwn: `*굵게*`(별 1개), `• ` 불릿, `#`헤더 불가.
- 소스: Techmeme 2 + TechCrunch 2 + 관심분야(XR/UX/스타트업) 최대 2(있을 때만).
- 톤: 입문자 기준, 용어 괄호 풀이.

## 유저 관심 분야
XR(AR/VR/MR·공간컴퓨팅·헤드셋/글래스), UX/프로덕트 디자인/HCI, 스타트업 생태계(펀딩·YC·창업자·AI 네이티브). [[user_career_background]]

## CLAUDE.md 수동 `jtech` 단축어
채널 루틴과 동일 신포맷으로 통일돼 있음(2026-06-30). 수동 실행은 그대로 유효.
