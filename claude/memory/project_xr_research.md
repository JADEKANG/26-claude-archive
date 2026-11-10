---
name: project_xr_research
description: "제이드 XR 연구(학부 인턴, ISMAR 목표) — 세계 물리 규칙 × 애니메이션 과장 Plausibility. 박사님(xr-researcher)과 1주차 필터 파이프라인 진행 중, 진척은 작업폴더 PROGRESS.md"
metadata:
  node_type: memory
  type: project
  originSessionId: 4cfd35a1-a2c5-4f81-ad55-ba30eb562da9
  modified: 2026-11-09T01:47:55.080Z
---

2026-11-09 시작. 제이드의 **개인 연구 프로젝트** (EO 업무와 별개). 앞으로 계속 디벨롭할 예정. 주제는 확정(아래 캐치업 참조).

**전담 에이전트:** `~/.claude/agents/xr-researcher.md` — XR 분야 30년 연구 경력의 연구자, 애니메이터 출신. 세션 전체를 이 페르소나로 하려면 `claude --agent xr-researcher`.

**셋업 현황 (2026-11-09):**
- uv/uvx 설치됨 (`~/.local/bin`)
- Blender 5.2.3: MCP 애드온(ahujasid/blender-mcp, "MCP for Blender" v1.8) 설치·활성화 완료. Claude Code user 스코프에 `blender` MCP 서버 등록(`uvx blender-mcp`). 사용 시 Blender에서 N 사이드바 → MCP for Blender → Connect.
- Unity: 에디터 2022.3.21f1, 6000.6.8f1 설치돼 있음. 프로젝트 아직 없음. CoplayDev unity-mcp 사용 예정 — 프로젝트 생성 후 Package Manager git URL `https://github.com/CoplayDev/unity-mcp.git?path=/MCPForUnity#main` → Window > MCP for Unity > Configure All Detected Clients.

**Why:** 제이드는 XR/HCI 쪽 커리어를 지향 ([[user_career_background]]), DL&CV 수강과도 연결 ([[project_last_semester_course_choice]]).

**How to apply:** 재개 시 `~/Desktop/Personal Prj/Test/xr_filter_wk1/PROGRESS.md`(로드맵·현재 위치·결정 대기)부터 읽고 박사님 호출. 노션 원본은 읽기 전용.

**호칭 (2026-11-09):** 제이드는 xr-researcher 에이전트를 **"박사님"**이라고 부름. ("xr 매니저"도 같은 에이전트)
**연구 자료 (최신, 읽기 전용·수정 절대 금지):** 제이드 개인 워크스페이스 Meeting log DB https://app.notion.com/p/4139bc7d8fb680039edcd63913288c07 (상위 "2026 Q3Q4"). 최종본 = "IRB 제출용 최종 피드백 전 정리" 4139bc7d8fb6804d82f2ed63c1859ff4 (10/28) + 1103 정기미팅. 10/28 이후가 최신. (perfect-menu-9e0.notion.site 공개링크·구 워크스페이스 사본은 Notion 연결로 안 열림/구버전)
**HMD 확정:** HTC VIVE Focus Vision + 컨트롤러, 렌더링 PC 별도. **Unity = 6000 확정 (2026-11-09).** 박사님 작업 산출물 폴더: ~/Desktop/Personal Prj/Test/xr_filter_wk1/ (1주차 2번 JSON 추출 완료, 3번 상체 Wang 필터 대기).

**캐치업 결과 (2026-11-09, 박사님):**
- 위 공개 사이트 링크는 Notion MCP로 접근 불가(404). 대신 연결된 워크스페이스의 "2026 Q3Q4" 페이지(id 3d59bc7d8fb680818d8de86a9d700545) 하위 연구 페이지들을 읽음 — 같은 자료로 추정, 제이드 확인 필요. 최신 편집 10/13.
- 연구 = 학부 인턴 연구(지도교수 김하연, 서강대). 주제 3 확정: "세계의 물리 규칙에 따른 애니메이션식 움직임 과장의 Plausibility". 목표 ISMAR(2027.3 초 제출).
- 설계(1013 최종안): 환경(VR 재현 방/패스스루 실제 방) 2 × 물리 규칙(현실/만화=공·상자 squash&stretch) 2 × 과장 강도(원본/약/강) 3, 참가자 내, 48클립(사건4×원인4×테이크3), 캐릭터 2m 앞 관찰, 재생 중 원인 4지선다 + 시행 후 Plausibility 7점. 과장 = Cartoon Animation Filter(Wang 2006)로 anticipation/follow-through만, IK 발 보정 파이프라인이 기여 1. ~50명(IRB 상한 70).
- 미해결: HMD 모델, 입력 방식, 모캡 장비, 교수님 질문 리스트 답변, IRB 제출 여부(10월 말 예정이었음).
- 박사님 제안 다음 단계: Blender에서 공개 모캡에 Cartoon Animation Filter+IK 사전 검증 프로토타입 → FBX로 Unity(재생·규칙 시뮬·응답 UI·로그).

**최신본 캐치업 (2026-11-09 2차):** 위 "2026 Q3Q4"(10/13)는 구버전. 최신 = Meeting log DB (collection://4139bc7d-8fb6-801d-9f13-000b56022d74), 최종본 "IRB 제출용 최종 피드백 전 정리"(4139bc7d8fb6804d82f2ed63c1859ff4, 10/28). 1103 정기미팅 페이지는 본문 비어 있고 tiro 링크는 로그인 필요 → 내용 미확인.
- 변경: 모캡 폐기→Mixamo 동작 선별(16개, 하한 12, 60fps, In Place 끔), 원인 4지선다 폐기→H2=상자 이탈 순간 트리거 예측. 필터=상체(척추·머리·양팔) 로컬 회전만, root·다리 제외(발 IK 없음). 상자=양 손목 중점 고정 오프셋, 놓는 프레임에 해제+속도 전달. 강도=양손목+머리 월드 피크 변위 증가율, 이득 이분탐색, 강은 파일럿 2단계. 매 시행 Plausibility+과장 7점, 블록 끝 규칙·환경·IPQ G1. 본실험 60명(IRB 상한 70), 사례비 3.5만/시간.
- HMD = HTC VIVE Focus Vision + 컨트롤러, 렌더링 PC 별도(스트리밍 가능성). Unity 중심 파이프라인(4.2).
- IRB: 10/30 최종 피드백·"제출 최종 Archive" 존재 → 제출 추정, 명시 확인 필요. 1027안은 root 수직이동 포함, 1028 최종은 root 전체 제외(의도 확인).
- 박사님 제안 Blender 역할: (1) 필터·강도측정 골든 레퍼런스(Unity 구현 교차검증) (2) 물리 가능성 검사 지표(COM/지지면, 손-상자 관통, 이탈속도) 시각화 (3) VR 재현 방 1:1 모델링.

**1103 정기미팅 (페이지 4139bc7d8fb680679877e21b9799f98a + 하위 "구현 1주차 목표 (1)"):**
- 타임라인(IRB 승인 11/16 가정): 승인 전=Mixamo 선별·필터·환경 구현·자체 리허설 / 11/16~12/6 파일럿 1~3단계 / 12/7~12/20 수정·재파일럿 / 12/21~1/24 본실험(60, 최대 70) / 1/25~2/7 분석 / 2/8~3월 중순 논문, 3월 중순 투고 / ~2027-03-31 IRB 종료.
- 구현 1주차: Mixamo 상자 던지기/떨어뜨리기 동작 1개 FBX(In Place 끔) → **Blender Python**으로 전 프레임 전 본 로컬 쿼터니언 + 양손목·머리 월드 좌표 JSON 저장 → 상체 본만 회전벡터(첫 프레임 기준 log map, 3채널)로 바꿔 Wang 필터 → 쿼터니언 복원 → FBX로 Unity(Humanoid)에서 필터 有/無 두 아바타 나란히 재생·녹화. 확인 포인트: gain 올리면 준비·마무리 동작이 눈에 띄게 커지는가.
- 옵션: Mixamo 후보 선별 표, 아바타 구매(남/여 사람), 이머시브홀 3DGS 배경 검토. 참고: CMU mocap, VIVE OpenXR Unity passthrough 튜토리얼.
- 즉 Blender = 필터 처리 도구로 공식화. 박사님 지적: 첫 프레임 기준 log map은 180° 근처 랩/쿼터니언 반구 뒤집힘 주의, 구매 아바타면 강도 측정은 최종 아바타 기준, FBX 왕복 설정(leaf bone 끔, 스케일) 주의, 3DGS는 10/8에 한번 배제됐던 안.

**1주차 2번 완료 (2026-11-09):** 작업 폴더 `/Users/eugenesmac/Desktop/Personal Prj/Test/xr_filter_wk1/` (박사님 산출물 전용, 1107test.blend는 읽기만). extract_motion_json.py → mixamo_com_motion.json(65본×132f, quat_raw/continuous, 손목·머리·Hips 월드 m, Z-up), validate_motion_json.py, README.md. 테스트 클립 = 1107test.blend의 `mixamo.com` 액션(오른손 오버핸드 던지기, 60fps 확정, 2.2s → 선정 기준 5 미달, 테스트 전용). 놓는 순간 후보 53–54f(오른손목 11 m/s). 반구 반전 0, 정규화 오차 4e-8. 다음 = 3번 상체 13본 Wang 필터.

**1주차 3번 완료 (2026-11-09, 백그라운드 Blender만 사용, 원본 blend md5 불변):** 폴더 before/ after/ scripts/로 정리. scripts/cartoon_filter.py(numpy: log/exp map, σ²LoG 커널 edge 패딩, f0→σ=√2/(2πf0), numpy FK(Blender 대비 오차 <1e-6m), 강도·이분탐색). f0 1.11Hz, σ 0.202s. 강 gain 1.672(29.9%), 약 0.781(14.9%). 사본 after/1107test_filtered.blend에 throw_weak/throw_strong. Unity = 6000 확정.
- 핵심 발견: ① 놓는 '프레임'(속도 피크 53–54)은 유지되나 놓는 순간 오른손목 위치가 강 51cm/약 25cm 어긋나고 속도 11→15.8 m/s(최종본 3.4 "어긋남 없음" 가정과 충돌) ② 커널 ±49f가 대기 구간까지 번짐: f1에서 10cm, f15에서 30cm 오프셋 → 1.5초 대기 자세를 필터 '전에' 앞뒤로 붙여야 함 ③ 강도 %가 왼손목(비투척, 기준 변위 0.36m)에 지배됨(강: 왼 61%, 오른 16%, 머리 12%), 오른손목 %는 gain≈1.9 이후 감소(비단조) → 지표 재정의 필요 ④ 몸통: 가슴 기울기 차 최대 9.7°(f61), 척추 gain 0.5배면 6.6° ⑤ Head 본 회전 변화 40°, RightForeArm 61° → 관절 한계·자기 관통 검사 필요.

**2026-11-09 세션 종료 시점 (저장):**
- 비교 영상 after/video_side_by_side_1x.mp4 / _half.mp4 (강|약|원본, scripts/bg_render_video.py — Blender 5.x 영상은 image_settings.media_type="VIDEO" 먼저).
- 원본 1107test.blend 수정시각 13:32로 바뀜 — 제이드가 Blender 종료 시 저장한 것으로 추정(박사님 작업은 md5 불변 확인). 라이브 Blender는 꺼져 있음, 백그라운드로 충분.
- 결정 대기(교수님 안건 후보): ① 놓는 순간 상자 출발조건(받아들임/원본 고정/놓는 구간 gain 감쇠) ② 강도 지표 재정의(합산 비율/가중/절대 cm) ③ 대기 1.5초 필터 전 부착(박사님 권장) ④ Focus Vision 단독 vs PC 스트리밍 ⑤ 아바타·3DGS·장소 ⑥ IRB 제출일/보완 ⑦ 1027→1028 root 제외 의도.
- 다음 진입점: 1주차 4번 = throw_strong FBX → Unity 6000 Humanoid 나란히 재생·녹화 (Unity 프로젝트 생성 + unity-mcp 셋업 필요).

**2026-11-10 세션 (재시작 전 저장):**
- 새 동작 5개(Box Idle, Throw Object, Push, Dropping, Throwing) `scripts/motion_pipeline.py`로 처리(라이브 Blender MCP, 동작당 `motions/<slug>/after/<slug>_compare.blend`). 선택 = Dropping + Throwing → Unity.
- Unity 6000 프로젝트 `~/Desktop/Personal Prj/Test/unity/XRFilterCompare/` (batchmode로 생성, Hub에는 아직 미등록). Editor 스크립트: MotionImport(Humanoid, root bake), BuildCompareScenes(메뉴 XR Filter), CaptureCompare. 씬 Compare_throwing/dropping (강|약|원본|MIXAMO RAW). 원본=RAW 포즈 일치로 왕복 검증.
- 제이드 소감: 과장은 되는데 확 보이진 않음. Unity·Blender 포즈 차이는 프로그램 차이로 수용. 미팅 자료 `xr_filter_wk1/MEETING_1110.md` (오늘 미팅 논의용).
- 제이드가 unity-mcp(CoplayDev) 연결함 → Claude 재시작.
- **재시작 후 할 일 (제이드 요청):** ① XRFilterCompare를 제이드 Unity Hub 프로젝트 목록에 등록하고 Hub로 열기 ② unity-mcp 도구 확인 ③ 비교 씬 영상 녹화(Unity Recorder 패키지 또는 프레임 캡처→mp4), 2개 씬 모두 ④ 영상 경로 알려주기.
