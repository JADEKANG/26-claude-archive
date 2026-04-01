---
name: TTM IP 진행 상황
description: EO 채널 The Thinking Mode IP 관련 작업 현황 및 다음 세션 이어갈 것들
type: project
---

## 완료된 작업 (2026-03-29)

- **Bharat Chandar 인터뷰 스크립트 섹션 브레이크다운**
  - 스크립트 전체 읽기 → 15개 섹션 + 타임스탬프 + 불릿 정리
  - 노션 페이지 업로드: https://www.notion.so/eoeoeo/Interview-Flow-Section-Breakdown-33274768ec37808e980fd1c2bc2b2e4d
- **TTM Script Summarizer 워크플로우 템플릿 생성**
  - 경로: `~/.claude/eo-thinking-mode/ttm-script-summarizer.md`
  - 사용법: 파일 경로 + 노션 URL 주고 "영상 구조 정리해줘" 하면 됨

## 완료된 작업 (2026-03-25)

- **TTM 영상 편집 패턴 분석 시스템 구축**
  - 공개 3편(Drew Bent/Rem Koning/Mihail Eric) 풀 스크립트 vs YouTube 최종 자막 비교 심층 분석
  - 편집 7대 원칙 + 15개 가이드라인 도출 (How > What > Mindset 공식 등)
  - Notion 페이지 정리: https://www.notion.so/eoeoeo/Video-Anylsis-for-Editing-Guide-32e74768ec3780ea8c28eb9eb3ba092e
  - 편집 가이드 문서: `~/.claude/eo-thinking-mode/editing/ttm-editing-guide.md`
  - **분석가 에이전트 스킬 생성** (`analyst-ttm-edit`) — 새 소스 넣으면 편집 방향성 자동 제안
  - 에이전트 라인업 정리: 리서치=셜록(`sherlock-*`), 분석=분석가(`analyst-*`)

## 완료된 작업 (2026-03-24)

- **전체 guest-candidates.md AI 옵티미즘 검증 완료**
  - 확정 유효: 7명 (Piech, Mollick, Bennett, Choudary, Valentine, Hougaard, Summerfield)
  - 제외 확정: 4명 (Brian Christian, Kyle Chayka, AI 전문 저널리스트, Sherry Turkle) — 모두 AI optimism 충돌
  - 보류 (이름 미확인 or 스탠스 미결): 7명
  - HUMAN 버티컬 공백 확인 — Chayka/Turkle 제외로 AI optimism 방향 HUMAN 후보 0명
- **셜록작가 TOP 4 심층조사 완료** — Choudary, Valentine, Summerfield, Hougaard
  - 결과물: `research/books/셜록작가-심층조사-TOP4-2026-03-24.md` (Notion import용 md 파일 생성)
- **셜록작가 Round 2 발굴 10인** — AI 옵티미즘 필터 적용, TOP 4 guest-candidates.md 반영
- **sherlock-books SKILL.md 업데이트** — AI 옵티미즘 7번째 필수 기준으로 추가 (단독 FAIL = 제외)
- **셜록작가 기존 4개 리서치 파일 섹션 구조 검토** — 9섹션 템플릿 대비 S4~S9 누락 확인
- **셜록작가 Phase 0.5 신규 발굴 4인** — Griffiths, Muldoon, Choudary, Julia (`research/books/draft-candidates-2026-03-24.md`)
  - Muldoon/Julia ❌ 제외, Griffiths/Choudary ⏸️ 보류 (Choudary 이후 심층조사에서 ✅ 확정)
- **희소성 기준 글로벌화** — 전 에이전트(books/academia/celeb/founder/jade) + shared-insights 일괄 수정
- **에피소드 Arc 구조 추가** — 전 셜록 스킬 5종 + research-template.md Section 7에 반영

### 이전 완료 (2026-03-24 오전)

- **포셜록 희소성 기준 수정** — 한국 한정 → 글로벌 영어권 미디어 기준으로 명확화
- **Jennifer Aaker 심화 리서치** 완료 (`research/academia/jennifer-aaker.md`) — HUMAN 버티컬 최우선 후보, 컨펌 대기
- **Stuart Russell 심화 리서치** 완료 (`research/academia/stuart-russell.md`) — Theme 6 Architects 후보, 컨펌 대기
- **Ken Goldberg 발굴 리서치** → 시의성 FAIL 판정, 보류 결정
- **셜록 에이전트 4종 리서치 브리프 템플릿 9섹션 구조로 교체**
- **리서치 공통 템플릿 파일 생성** (`~/.claude/eo-thinking-mode/research-template.md`)
- **Section 6 버티컬 전면 교체** — 4 Verticals → Six Big Questions Q1-Q6
- **공통 템플릿 참조 링크 + Sources 섹션** — 전 셜록 스킬(5종)에 추가

### 이전 완료 (2026-03-23)

- shared-insights.md에 EP1-4 Retro 전체 반영: Six Big Questions 프레임워크, 퍼포먼스 데이터, 카피 A/B 패턴, Intellectual Tension 프레임워크, 시청자층 프로필, 게스트 선발 기준 재정의
- 포셜록 발굴 모드로 학계 후보 10명 리서치 완료 (`research/draft-candidates-2026-03-23.md`)

### 이전 완료 (2026-03-20)

- sherlock-books 스킬 강화, 크론 등록, 기획회의 반영
- Drew Bent EP4 분석, TTM 영상 전체 채점, 셜록제이드 스킬 생성
- YouTube RSS 자동화 파이프라인, my-session-wrap 스킬 복원

## 완료된 작업 (2026-03-31)

- **Bharat Chandar EP9 편집 가이드 최종본 완성**
  - 선언적 발언 vs 학자 헷지 구분 정리 완료 → `bharat-declarative-statements.md`
  - 유진님 스크립트 노트 정리 + 편집 가이드 연결 맵핑
  - 기존 노션 가이드 + 오늘 브레인스토밍 통합한 최종본 저장 → `bharat-editing-guide-final.md`
  - 오프닝 몽타주 확정: 16% → 2부류 공감 [43:50] → 매니저 선언 → Stanford
  - Lesson 1/2/3 구조: 사실 검증 → 구조 분석(왜 주니어인가) → 실전 가이드(Manager Thesis)
  - 제목/썸네일 후보 빌딩 (팩트체크 톤, 데이터 기반)
  - 제목 기존 노션대로 확정: *Stanford Analyzed Millions of Jobs. Junior Roles Are Disappearing.*
  - `bharat-interview-review.md` TODO "선언적 발언 구분 정리" 체크 완료

## 완료된 작업 (2026-03-30)

- **셜록 에이전트 5종 일괄 효율화**
  - 전 에이전트 상단에 `⚡ 절대 기준` 테이블 추가 (AI 옵티미즘 / 컨펌 프로세스 / shared-insights 선독)
  - sherlock-books: 베스트셀러 기준 4번째 절대 기준 추가
  - sherlock-academia: 선발기준 테이블에 AI 옵티미즘 행 추가 (단독 FAIL 명시)
  - sherlock-books/celeb/founder: 4 Verticals → Six Big Questions 교체 (미션 + 페르소나)
- **analyst-ttm-edit 토큰 최적화**
  - 풀 스크립트 선택적 읽기 강제 (`Read limit:150` → Grep → 섹션별 읽기)
  - audience-insights.md 조건부 로드로 변경 (HUMAN 버티컬/감정 앵글 시에만)
- **guest-candidates.md 정리**: 검증 결과 요약 중복 테이블 삭제 (-28줄)
- **주간 효율화 점검 회고 루틴 시작** — 매주 my-history-insight로 점검
- **Bharat Chandar EP9 인터뷰 작업**
  - 스크립트 전체 분석 + 타임코드별 핵심 발언 추출
  - 헷갈렸던 8개 지점 스크립트 근거 붙여 리마인드 정리
  - TTM 오디언스 데이터 기반 "먹히는 주장" 앵글 분석
  - Hot Takes Breakdown 1/2/3순위 정렬 완료 → `bharat-hot-takes-breakdown.md` 저장
  - Notion 업로드 미완료 (재시작 후 진행)

## 다음 세션에서 이어갈 것

1. **[최우선] Notion MCP 재연결** — claude.ai 웹에서 Notion OAuth 재인증 필요 (Settings → Integrations → Notion → Configure). 연결 후 Claude Code 재시작하면 복구됨. 또는 Notion API 토큰으로 로컬 MCP 설치 (워크스페이스 관리자 권한 필요).
2. **[최우선] Bharat 편집 가이드 + Hot Takes → Notion 업로드** — `bharat-editing-guide-final.md` + `bharat-hot-takes-breakdown.md` → Notion 페이지 (MCP 복구 후)
3. **[최우선] HUMAN 버티컬 AI optimism 후보 발굴** — Chayka/Turkle 제외로 공백. 4개 에이전트 전원 발굴 필요.
3. **[최우선] Aaker/Russell 컨펌** — guest-candidates.md 반영 + 리서치 파일 9섹션 소급 반영
4. **Po-Shen Loh 풀 스크립트 확보 시 분석 추가** — 254k 최고 조회수 에피소드, 편집 패턴 분석 보강
5. **Griffiths TED Talk 확인** — "AI ≠ 인간 사고" thesis가 optimism 프레이밍 가능한지 판별
6. **포셜록 이름 미확인 5명 해결** — 램코 교수, Anthropic 철학자, 불확실성 연구자, HCI 연구자 이름 확인 + AI 옵티미즘 재판정
7. **컨펌된 후보 9섹션 심화 리서치 진입** — Mollick, Bennett 우선
8. **셜록EO / 셜록제이드 첫 리서치** — 아직 0명

## 참고 경로

- TTM 공유 지식: `~/.claude/eo-thinking-mode/shared-insights.md`
- 게스트 후보: `~/.claude/eo-thinking-mode/guest-candidates.md`
- 발굴 드래프트: `~/.claude/eo-thinking-mode/research/draft-candidates-2026-03-23.md`
- 포셜록 심화 리서치: `~/.claude/eo-thinking-mode/research/academia/`
- 영상 채점: `~/.claude/eo-thinking-mode/ttm-video-scores.md`
- 편집 가이드: `~/.claude/eo-thinking-mode/editing/ttm-editing-guide.md`
- 분석가 스킬: `~/.claude/skills/analyst-ttm-edit/SKILL.md`
- 포셜록 스킬: `~/.claude/skills/sherlock-academia/SKILL.md`
- EO RSS: `https://www.youtube.com/feeds/videos.xml?channel_id=UClWTCPVi-AU9TeCN6FkGARg`

**Why:** 4월 촬영 목표, 3월 말까지 주요 섭외 확정 필요. HUMAN 버티컬(Aaker)과 Theme 6 Architects(Russell) 컨펌이 당장 과제.
