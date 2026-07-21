---
name: claude-code
description: ~/.claude 설정(스킬/CLAUDE.md/메모리)의 효율화 작업 — 다음 세션에서 이어서 진행
metadata: 
  node_type: memory
  type: project
  originSessionId: 4c6a20a8-0f2d-43a4-bb99-91ce5c689e13
---

다음 세션에서 "최적화" 요청 시 아래 항목을 실행한다.

**Why:** 매 대화 context 낭비, 스킬 중복 유지보수 비용, 메모리 누락 방지를 위해 정리 필요.

**How to apply:** 유저가 "Claude Code 최적화", "설정 최적화", "저번에 얘기한 최적화" 언급 시 이 항목 리스트를 제시하고 진행.

---

## 대기 중인 최적화 항목 (우선순위 순)

### 🔴 즉시
1. **JTech → 스킬 분리**: CLAUDE.md의 JTech Daily Brief 인라인 워크플로우를 `~/.claude/skills/my-jtech/SKILL.md`로 이전. CLAUDE.md에는 트리거 한 줄만 남김 → 매 대화 context 절약
2. **Memory 인덱스 누락 수정**: `feedback_tyler_haiku.md`가 MEMORY.md에 없음 → 항목 추가

### 🟡 다음
3. **영어학습 루틴 GitHub 개인 계정 이전** (2026-07-02 제이드 지시): 클라우드 루틴이 쓰는 `yjk-claude/english-study` 저장소를 제이드 개인 GitHub 계정으로 이전. 루틴 2개(영어 아침 표현 `trig_014YN2uVMDeS3zHjhYkw6Ed2`·영어 저녁 recap은 비활성)의 repo URL도 함께 업데이트 필요. [[reference_jtech_routine]]
4. **Sherlock 공통 기준 추출**: `sherlock-founder`, `sherlock-jade` 등에 동일하게 복붙된 ⚡ 절대 기준 3개(AI 옵티미즘 필터, 컨펌 프로세스, shared-insights.md 선독)를 `~/.claude/eo-thinking-mode/sherlock-common.md`로 추출

### 🟢 나중
4. **my-session-wrap TTM 하드코딩 제거**: Step 2에서 `project_ttm_ip.md` 직접 명시 → 현재 프로젝트 메모리 파일을 동적으로 찾는 로직으로 변경
5. **plans/ 폴더 정리**: `cozy-napping-karp.md`, `indexed-dazzling-dream.md` 완료 여부 확인 후 삭제
