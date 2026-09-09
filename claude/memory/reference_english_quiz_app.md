---
name: reference-english-quiz-app
description: 점심 영어 학습 아티팩트 앱 (Tyler 단어장 퀴즈/플래시카드) + 빌드·재배포법 + 노션캘린더 알림 + 슬랙 인박스 자동수집 흐름
metadata: 
  node_type: memory
  type: reference
  originSessionId: 6f2112b3-a1bf-4b6e-a0dd-a55fc3c8e6b4
  modified: 2026-09-09T02:32:25.650Z
---

# 점심 영어 · Tyler의 단어장 (아티팩트 앱, 2026-07-01 제작)

유저가 점심시간마다 영어 테스트/단어장 복습하려고 만든 독립 웹앱. 세션에 묻혀 까먹는 문제 해결용.

## 앱
- **아티팩트 URL (2026-09-09 갱신, JADEKANG 개인 계정으로 재발행)**: https://claude.ai/code/artifact/4a3f8c3c-a396-466d-b7b6-a18b1a91bf9d (비공개, 유저 본인만)
- 구 URL(25a4b01d...)은 EO 계정 소속이라 퇴사 후 접근 불가 — `~/english-study` repo(github.com/JADEKANG/english-study)에서 새로 clone·재배포함.
- 기능: 오늘의 **8문제(선택형 3 + 작문형 5)** / 플래시카드(flip·외운것 체크) / 스트릭 / **참여율**(스탯 1칸 %, 최근 4주 평일 기준, store.done 날짜배열 — 히트맵은 유저 요청으로 제거·축소함, 복구 가능) / **범위 필터**(전체·최근2주·안외운것) / **종류 필터**(단어·표현·약어·자주틀림). 표현 344개.
- **작문형**: 뜻(+빈칸예문) 보고 영어로 타이핑→확인→**자동 채점**(2026-07-03: 자가채점 버튼 폐지). autoGrade() = 대체표현(` / ` 분리)·괄호 무시·문장 속 정답 인정·오타 1글자(치환/추가/누락/인접 뒤바뀜) 허용. 오판 대비 "판정 수정" 링크(judgeFix)로 뒤집기 가능. 선택형 3 + 작문 5 = 8, 점수 /8.
- **틀린 것 재시험** (2026-07-03 추가): 결과 화면 "틀린 것 바로 재시험" 버튼 → 틀린 항목 전부 **작문형**으로, 문제 형태를 뒤집어 출제(빈칸→뜻영작, 뜻영작→빈칸. variant 추적). 재시험은 스트릭·최고점수·참여율에 미반영(isRetest). 다 맞을 때까지 체인 가능.
- **한국어 뜻 없는 항목 처리** (2026-07-03 버그픽스): 약어 8개(lmk·mtg·ooo·wfh·eod/cob·fwiw·iirc·w//w/o)는 뜻이 영어 풀이라 작문 문제에서 "영작할 한국말이 안 나오던" 원인 → buildQuiz에서 선택형 슬롯으로 강제 배치, 작문으로 나올 땐 "약어로 써보세요" 라벨.
- ★**종류 분류**: word 46 / phrase 263 / abbr 13 / corr(자주틀림=교정노트) 22. corr은 객관식 부적합 → 플래시카드 전용.
- 디자인: 사전(lexicon) 결. 세리프 표제어 + 페트롤 잉크블루(#1F5673) + 따뜻한 종이 바탕. Tyler(냉철·논리) 톤. favicon 📖.

## ★빌드·재배포 (vocab.md에 표현 늘면)
- 파일: `~/english-study/` 에 `build_app.py`(파서+분류기) + `_template.html`(UI, `/*DECK_JSON*/` 자리) + 산출 `quiz.html`.
- 절차: ①`cd ~/english-study && python3 build_app.py` (vocab.md 파싱→분류→quiz.html 생성) → ②Artifact 도구로 **같은 file_path `~/english-study/quiz.html`** 재배포 → **같은 URL 유지**, 데이터 자동 반영.
- 분류기(build_app.py kind()): ❌/→/✅/vs/문법패턴 → corr / 약어셋·대문자이니셜 → abbr / 공백없음 → word / 나머지 → phrase.
- 데이터 소스: `~/english-study/vocab.md` (my-slack-english 스킬이 날짜별로 append하는 단어장).

## 캘린더 알림 (2026-09-09 개인 계정으로 재설정)
- 구 일정(event id `7tg5d9a0okn5jb2hat2v4h11ms`, 캘린더 `yjk@eoeoeo.net`, 노션 캘린더 미러)은 EO 계정 소속이라 퇴사 후 소실.
- **신규**: 구글 캘린더 **`yhgene21@gmail.com`**에 유저가 직접 등록 (이 환경엔 Google Calendar MCP 커넥터가 없어서, Claude가 사전 채움된 `calendar.google.com/calendar/render?action=TEMPLATE...` 링크를 만들어주고 유저가 클릭해서 저장하는 방식 사용).
- **일정**: "점심 영어 · Tyler 단어장", 평일(월~금) **1:00~1:15 PM Asia/Seoul**, 반복(RRULE WEEKLY;BYDAY=MO,TU,WE,TH,FR), 설명란에 새 아티팩트 URL 포함.
- 노션 미러 여부는 미확인 (이번엔 노션 언급 없이 구글 캘린더만 요청받음) — 노션에도 띄우고 싶으면 그 캘린더를 노션 페이지에 새로 연결해야 함.

## ★표현 자동수집 (인스타·스레드 → 앱)
- 유저 목표: 인스타·스레드 팔로우들이 올리는 표현을 모아 앱에 매일 학습 반영.
- **불가**: IG/스레드 자체를 무인으로 긁어오는 것(Meta API 폐쇄+스크래핑 차단). 사람이 내용을 꺼내주는 한 단계는 필수.
- **가능(완전자동)**: 텍스트/스샷이 들어오면 추출→뜻·예문→중복제거→vocab.md 추가→앱 재배포.
- **인박스 = 슬랙 스레드** (2026-07-01 확정·등록완료, **2026-09 기준 유저가 슬랙을 더 이상 안 씀 — 이 파이프라인 사실상 stale, 재설계 필요**). 앵커 = 유저 자기 DM의 "영어공부용" 메시지. **channel_id `D0A7K00GT1N` / parent message_ts `1782873218.434369`** (구 EO 워크스페이스 소속이라 접근도 불가할 수 있음).
- **처리 루프**: "영어수첩 업데이트" 하면 → `slack_read_thread(D0A7K00GT1N, 1782873218.434369)` 로 새 답글 읽기 → 표현 추출·뜻·예문(Tyler 방식) → vocab.md 오늘 날짜 섹션에 append(중복 제거) → `python3 build_app.py` → Artifact 재배포(같은 URL). ※이미 처리한 답글 재처리 방지: 마지막 처리 ts를 이 메모리나 처리시점 기록으로 관리(스샷은 이미지라 slack_read_file/read 이미지로 OCR).
- (폐기) 바탕화면 폴더 `~/Desktop/영어수첩`은 슬랙 선회로 삭제함.
- ※완전 예약(무인) 루틴은 헤드리스에서 슬랙 커넥터 미연결 리스크 → 온디맨드("영어수첩 업데이트")로 시작.

## ★스타트업 용어 사전 (2026-07-08 추가)
- 홈 화면에 "🚀 스타트업 용어 사전" 버튼 별도 신설. 스타트업 카테고리(scrappy·burn rate·PMF 등 40개, vocab.md `## 2026-07-08 (스타트업 필수 50개)` 섹션)에서 랜덤 10문제, **전부 영작형**(객관식 없음).
- 구현: `build_app.py` parse()가 날짜 헤더 텍스트에 "스타트업" 포함 여부로 `cat:"startup"` 태그 부여 → `_template.html`에 `buildStartupQuiz()` 별도 함수(N_SU=10, 전부 type:'wr') + `isStartupQuiz` 플래그로 스트릭/최고점수 등 기존 통계 오염 방지(store 저장 skip). `lastBuilder` 변수로 "다른 문제 더 풀기"가 직전 모드(메인/스타트업) 유지.
- vocab.md에 스타트업 관련 표현 새로 추가할 땐 날짜 헤더에 "스타트업" 텍스트 포함시켜야 이 탭에 잡힘.

## 관련 메모리
- [[reference_notion_callout_skill]] · [[feedback_tyler_haiku]] (Tyler=my-slack-english 스킬)
