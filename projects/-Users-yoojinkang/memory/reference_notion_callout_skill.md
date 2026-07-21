---
name: reference_notion_callout_skill
description: "my-notion-callout 스킬 + \"I:\" 단축어 — 노션 메모에서 인사이트 추출해 callout에 정리"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 547e34e7-6bb5-44aa-a868-ada04ed6df19
---

다큐/인터뷰 1차 편집본을 보며 적은 노션 메모를 받아 핵심 원칙·인사이트를 추출하고 페이지 맨 밑 callout 블럭에 정리하는 워크플로우.

- **스킬**: `my-notion-callout` (`~/.claude/skills/my-notion-callout/SKILL.md`)
- **단축어**: 입력이 `I:`로 시작 + 노션 링크 → 즉시 스킬 실행 (CLAUDE.md 자동 트리거 섹션에 등록, `t:`와 동일 방식)
- **핵심 동작**: 메모 항목을 그대로 옮기지 않고 **그 밑의 원칙을 추상화**. `***`/볼드/"중요" 표시는 1순위로, 반복 패턴은 하나로 묶어 5~7개 번호 원칙 + "한 줄 요약" 형태의 callout 작성 (기본 📌 아이콘 + gray_bg). 빈 callout 있으면 채우고 없으면 맨 밑에 추가.

유저(EO PD)의 편집 방법론([[feedback_editing_method]])과 직결 — 추출 기준에 캐릭터빌딩·후킹 심리설계가 녹아있음.
