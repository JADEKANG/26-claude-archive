---
name: TTM IP 진행 상황
description: EO 채널 The Thinking Mode IP 관련 작업 현황 및 다음 세션 이어갈 것들
type: project
---

## 완료된 작업 (2026-03-20)

- sherlock-books 스킬 강화: 트랙 4개(베스트셀러/토픽퍼스트/시의성/백리스트+팟캐스트), 주 2회 발굴 모드, 우선순위 스코어링
- 크론 등록: 화/금 오전 8:03 자동 스캔 (crontab)
- 3/17 기획회의 내용 반영: guest-candidates.md, shared-insights.md
- EO 글로벌 채널 RSS 피드 확인 (채널 ID: UClWTCPVi-AU9TeCN6FkGARg)
- Drew Bent EP4 영상 분석 완료 + 저장
- TTM 영상 전체 채점 완료 (Po-Shen Loh 98점 벤치마크, 채점 기록: ttm-video-scores.md)
- 모델 claude-opus-4-6으로 변경 (settings.json)
- 셜록제이드 스킬 생성 완료 — AI Native 생태계/지정학 전담, Vertical 유연, 개인탐구+게스트발굴 듀얼모드
- YouTube RSS 자동화 파이프라인 완성 — eo-rss-monitor.sh, 6시간마다 크론, 새 영상 감지→자막→채점 자동화
- my-session-wrap 스킬 복원
- 모든 변경사항 git commit 완료

## 다음 세션에서 이어갈 것

1. **셜록작가 작업** — 구체적 작업 내용 확인 필요 (이번 세션 미착수)
2. **셜록제이드 첫 리서치 실행** — "인도/르완다 AI Native 양성 환경" 탐구 + 게스트 후보 발굴
3. **my-fetch-youtube 스킬 업데이트** — TTM 채점 기준 추가 (유저 승인 대기)

## 참고 경로

- TTM 공유 지식: `~/.claude/eo-thinking-mode/shared-insights.md`
- 게스트 후보: `~/.claude/eo-thinking-mode/guest-candidates.md`
- 영상 채점: `~/.claude/eo-thinking-mode/ttm-video-scores.md`
- Drew Bent 분석: `~/.claude/eo-thinking-mode/research/drew-bent-analysis.md`
- EO RSS: `https://www.youtube.com/feeds/videos.xml?channel_id=UClWTCPVi-AU9TeCN6FkGARg`

**Why:** 4월 촬영 목표, 3월 말까지 주요 섭외 확정 필요. TTM IP 시의성 있는 저자/게스트 발굴이 핵심 과제.
