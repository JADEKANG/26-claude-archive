---
name: my-session-wrap
description: 세션 마무리 스킬. 작업 요약 → 메모리 업데이트 → 다음 세션 TODO 정리 → git 커밋. "wrap", "세션 마무리", "오늘 작업 정리" 요청에 사용.
triggers:
  - "wrap"
  - "세션 마무리"
  - "오늘 작업 정리"
---

# my-session-wrap — 세션 마무리 스킬

## 동작 순서

아래 4단계를 순서대로 실행한다.

---

### Step 1 — 작업 요약

이번 세션에서 완료한 작업을 간결하게 정리한다.

```
## 오늘 작업 요약 (YYYY-MM-DD)

### 완료
- [작업 1]
- [작업 2]

### 미완료 / 중단
- [있으면 기록]
```

---

### Step 2 — 메모리 업데이트

`~/.claude/projects/-Users-yoojinkang/memory/project_ttm_ip.md` 를 읽고:

1. **완료된 작업** 섹션에 오늘 완료 항목 추가
2. **다음 세션에서 이어갈 것** 섹션을 오늘 기준으로 갱신
   - 완료된 항목 제거
   - 새로 생긴 TODO 추가
   - 우선순위 순으로 정렬
3. 날짜 업데이트

---

### Step 3 — git 커밋

`~/.claude` 디렉토리에서 git status 확인 후:

1. 오늘 작업한 파일만 선택적으로 스테이징 (`.omc/`, `cache/`, `sessions/`, `history.jsonl`, `paste-cache/`, `shell-snapshots/`, `file-history/`, `.session-stats.json` 제외)
2. 변경사항이 있으면 커밋 메시지 작성 후 커밋
3. 변경사항 없으면 "커밋할 내용 없음" 표시

커밋 메시지 형식:
```
Session wrap: [날짜] — [핵심 작업 한 줄 요약]

- [완료 항목 1]
- [완료 항목 2]

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
```

---

### Step 4 — 다음 세션 브리핑

```
## 다음 세션에서 할 것

1. **[최우선]** [작업명] — [한 줄 설명]
2. [작업명] — [한 줄 설명]
3. [작업명] — [한 줄 설명]

## 참고할 것
- [있으면 기록]
```

---

## 실행 원칙

- git에 민감한 파일 (.env, credentials 등) 절대 포함 금지
- 메모리 업데이트는 덮어쓰지 않고 기존 내용 유지하며 갱신
- 커밋은 오늘 작업한 파일만 — `git add -A` 금지
