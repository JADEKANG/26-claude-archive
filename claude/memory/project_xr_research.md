---
name: project_xr_research
description: "제이드의 개인 XR 연구 프로젝트 — 장기 디벨롭 예정, Blender 먼저 → Unity. 전담 에이전트 xr-researcher(XR 30년+애니메이터 출신)"
metadata:
  node_type: memory
  type: project
  originSessionId: 4cfd35a1-a2c5-4f81-ad55-ba30eb562da9
  modified: 2026-11-09T01:47:55.080Z
---

2026-11-09 시작. 제이드의 **개인 연구 프로젝트** (EO 업무와 별개). 앞으로 계속 디벨롭할 예정. 구체적인 연구 주제는 아직 정해지지 않음 — 다음 세션에서 먼저 확인할 것.

**전담 에이전트:** `~/.claude/agents/xr-researcher.md` — XR 분야 30년 연구 경력의 연구자, 애니메이터 출신. 세션 전체를 이 페르소나로 하려면 `claude --agent xr-researcher`.

**셋업 현황 (2026-11-09):**
- uv/uvx 설치됨 (`~/.local/bin`)
- Blender 5.2.3: MCP 애드온(ahujasid/blender-mcp, "MCP for Blender" v1.8) 설치·활성화 완료. Claude Code user 스코프에 `blender` MCP 서버 등록(`uvx blender-mcp`). 사용 시 Blender에서 N 사이드바 → MCP for Blender → Connect.
- Unity: 에디터 2022.3.21f1, 6000.6.8f1 설치돼 있음. 프로젝트 아직 없음. CoplayDev unity-mcp 사용 예정 — 프로젝트 생성 후 Package Manager git URL `https://github.com/CoplayDev/unity-mcp.git?path=/MCPForUnity#main` → Window > MCP for Unity > Configure All Detected Clients.

**Why:** 제이드는 XR/HCI 쪽 커리어를 지향 ([[user_career_background]]), DL&CV 수강과도 연결 ([[project_last_semester_course_choice]]).

**How to apply:** 다음 세션은 Blender MCP 연결 확인(테스트 큐브) → 연구 주제·첫 프로토타입 정의부터. Unity는 Blender 작업이 끝나고 넘어갈 때 셋업.

**호칭 (2026-11-09):** 제이드는 xr-researcher 에이전트를 **"박사님"**이라고 부름. ("xr 매니저"도 같은 에이전트)
**연구 자료 (최신, 읽기 전용·수정 절대 금지):** 제이드 개인 워크스페이스 Meeting log DB https://app.notion.com/p/4139bc7d8fb680039edcd63913288c07 (상위 "2026 Q3Q4"). 최종본 = "IRB 제출용 최종 피드백 전 정리" 4139bc7d8fb6804d82f2ed63c1859ff4 (10/28) + 1103 정기미팅. 10/28 이후가 최신. (perfect-menu-9e0.notion.site 공개링크·구 워크스페이스 사본은 Notion 연결로 안 열림/구버전)
**HMD 확정:** HTC VIVE Focus Vision + 컨트롤러, 렌더링 PC 별도.

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
