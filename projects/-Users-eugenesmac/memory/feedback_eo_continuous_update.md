---
name: EO 정보 지속 업데이트
description: 채널 분석/리서치 시 EO 메모리를 최신 영상 기준으로 업데이트할 것
type: feedback
---

EO 관련 작업(채널 분석, 리서치, 아이디에이션) 시 메모리에 저장된 EO 정보를 최신 상태로 업데이트해야 한다.

**Why:** EO는 유저의 회사이며, 새 영상이 계속 나오므로 인터뷰이 리스트, 조회수, 경쟁 환경 등이 변한다. 오래된 데이터로 분석하면 의미가 떨어진다.

**How to apply:**
- EO 관련 리서치/분석 세션 시작 시 웹 검색으로 최신 영상/구독자 수 확인
- 새 인터뷰이가 있으면 `project_eo_interviewees.md` 업데이트
- 경쟁 채널 구독자 수 변동 시 `project_eo_competitive_landscape.md` 업데이트
- 새로운 IP/시리즈가 생기면 `project_eo_video_ips.md` 업데이트
- 업데이트 대상 파일 위치: `~/.claude/memory/` (글로벌 메모리)
- 기업 정보 리포트: `~/claude/EO_company_profile.md` (회사 개요, 철학, 브랜드, 수익모델, 성장 히스토리)
- 채널 분석 리포트: `~/claude/EO_channel_analysis.md` (제작방식, IP, 인터뷰이, 경쟁환경, SWOT)
- IP 성과 분석 리포트: `~/claude/EO_ip_performance.md` (IP별 조회수, 고/저성과 패턴, 편집 방향, 인터뷰이 추천)
- 각 리포트 하단 업데이트 로그에 변경 기록
