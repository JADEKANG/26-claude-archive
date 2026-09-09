---
name: project-claude-account-migration
description: "Claude 계정(JADEKANG 개인 계정) + 새 노트북(eugenesmac) 이전 — 2026-09-09 사실상 완료, 남은 건 yjk repo 정리 정도"
metadata: 
  node_type: memory
  type: project
  originSessionId: 65f29490-135e-4044-bad4-294cf2c852df
  modified: 2026-09-09T02:33:30.081Z
---

기존 GitHub/Claude 계정과 노트북을 정리하고 JADEKANG 개인 계정 + 새 노트북(macOS 유저네임 `eugenesmac`)으로 옮기는 작업.

**Why:** 기존 GitHub 계정(`yjk-claude`)이 연결된 구글 계정이 사라질 예정이었음 → 관련 repo/서비스 소실 위험 회피. EO 퇴사도 겹쳐서 EO 소속 계정/자동화(사내 대시보드 텔레메트리 등)도 함께 정리.

**2026-09-09 새 노트북에서 실제 복원 완료 — 상태:**
- ✅ gh CLI 설치 + JADEKANG 계정 인증(`gh auth login`), git credential helper 연결.
- ✅ `26-claude-archive` clone → `~/.claude`로 선택적 복원(memory 41→43개 병합·legacy EO 메모리 포함, skills 11개, CLAUDE.md는 **트리거/프로젝트 섹션만**(OMC 오케스트레이션 섹션은 제외 — 플러그인 미설치라 무의미), settings.json은 `bypassPermissions`/`skipDangerousModePermissionPrompt`/`voiceEnabled`/`tui` 등 반영). eo-thinking-mode·eo-realvalley도 이번엔 살려서 복원함(이전엔 보류였음).
- ✅ **OMC 플러그인 재설치 안 함**(결정) — 필요해지면 별도 요청.
- ✅ **EO 사내 대시보드 텔레메트리 hook 6개 전부 삭제**(hook_health/codex_push/gemini_push/generate_activity/generate_backfill/otel_push) — 퇴사했으니 EO로 사용량 자동 전송될 이유 없음.
- ✅ **jtech: Slack → Gmail 전환** — 더 이상 Slack 안 써서 발송처를 `ujini02@gmail.com` SMTP(App Password)로 교체. launchd(`net.eoeoeo.jtech`, 매일 09:00 KST) 재등록 + e2e 테스트 발송 성공. 상세: [[reference_jtech_routine]].
- ✅ **26-claude-archive repo 구조 재정리** — repo root를 `claude/` 폴더 하나로 통합(memory/skills/hooks/jtech/launchd/eo-thinking-mode/eo-realvalley/CLAUDE.md/settings.json/MIGRATION.md), 중복이던 legacy 경로(`projects/-Users-yoojinkang/`, 구버전 루트 `memory/`) 제거.
- ✅ **앞으로 작업물도 자동 백업** — `~/.claude/backup-to-github.sh` 신설 + `Stop` hook에 연결 → 세션 종료마다 백그라운드로 `~/.claude`→`26-claude-archive/claude/` 동기화 후 커밋+푸시(실패해도 세션 종료 안 막음). 시크릿(webhook/앱비번)은 `.gitignore`로 확실히 제외.
- ✅ `english-study` repo 복원(`~/english-study`) → Tyler 퀴즈앱 새 계정으로 재배포: https://claude.ai/code/artifact/4a3f8c3c-a396-466d-b7b6-a18b1a91bf9d ([[reference_english_quiz_app]]).
- ✅ **english-study-bot 완전 삭제**(GitHub repo + 로컬 clone) — 안 쓰기로 결정. 관련해서 Vercel 계정 이전 이슈도 자동 소멸.
- ✅ **캘린더 알림 재설정** — Google Calendar MCP 커넥터가 없어서 사전 채움 `calendar.google.com/render?action=TEMPLATE...` 링크를 만들어줬고, 유저가 `yhgene21@gmail.com` 계정에 직접 저장(평일 1PM 반복). 노션 미러 여부는 미확인.

**남은 것:**
1. `yjk` repo(`~/yjk`) — clone만 해둠, 아직 정리 안 함. Drew Bent 쇼츠/EO 분석/야놀자 자막/영어 오답노트 같은 콘텐츠와, 죽은 `.omc/`·`.claude/scheduled_tasks.lock` 같은 실행 잔재가 섞여있음. 분리·정리 여부 결정 필요.
2. Slack 기반 영어표현 자동수집 파이프라인([[reference_english_quiz_app]] 참고)이 Slack 미사용으로 stale — 재설계 필요.
3. Claude.ai MCP 커넥터(Notion/Google Calendar 등) 재연동은 필요할 때 온디맨드로.

**How to apply:** 이 프로젝트는 사실상 마무리 국면 — 이제 "이전 작업"보다는 개별 항목(yjk 정리 등) 단위로 접근. `~/.claude/MIGRATION.md`는 구 노트북 기준 원본 체크리스트로 참고용 보관.
