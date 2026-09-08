---
name: reference_xai_mechinterp_resources
description: XAI/mechanistic interpretability 독학 자료 — transformer-circuits.pub 읽는 순서 + 병행 코스
metadata: 
  node_type: memory
  type: reference
  originSessionId: bf4fcb1d-d291-48ce-a8d9-818f893ceaa8
  modified: 2026-09-08T12:00:21.445Z
---

[[project_last_semester_course_choice]]에서 이어지는 XAI 독학 계획용 자료 목록.

## 핵심: Anthropic의 transformer-circuits.pub
LLM 내부를 뉴런/회로 단위로 뜯어보는 mechanistic interpretability 연구를 인터랙티브 웹페이지 형태로 공개하는 Anthropic 해석성 팀의 저널. 논문 PDF가 아니라 시각화·데모가 들어간 스토리텔링 형식(옛 Distill 저널 스타일 계승)이라 진입장벽이 낮음.

**추천 읽는 순서:**
1. **Scaling Monosemanticity** (2024) — Sparse Autoencoder로 모델 내부 개념(feature)을 추출. "Golden Gate Claude" 사례 나온 곳, 인터랙티브 feature 브라우저 있어서 직접 만져볼 수 있음. 가장 재밌는 입문 챕터.
2. **On the Biology of a Large Language Model** (2025, Circuit Tracing 후속작) — critical 시각의 핵심. 모델이 말하는 근거(chain-of-thought)와 실제 내부 계산 회로가 다를 수 있음을 실증(예: 수학 문제 답을 먼저 찍고 그럴듯한 풀이를 사후에 지어내는 motivated reasoning).
3. **Toy Models of Superposition** (2022) — 뉴런 하나가 여러 개념을 동시에 표상하는 polysemanticity 현상을 작은 모델로 설명. 개념 기초 다지고 싶을 때.
4. (선택, 진입장벽 높음) **A Mathematical Framework for Transformer Circuits** (2021), **In-Context Learning and Induction Heads** (2022)

## 병행 자료
- **실무형/가벼운 툴 학습**: Coursera(Duke University) "Explainable Machine Learning" — SHAP/LIME/PDP 실습 위주.
- **본격적 코스(DL&CV 이후 추천)**: ARENA(Alignment Research Engineer Accelerator) 커리큘럼, Neel Nanda의 TransformerLens 튜토리얼.
- Dario Amodei "The Urgency of Interpretability" 에세이 — 왜 이 분야가 중요한지 배경 논지.

## 참고: XAI 강의 자료 요약 위치
서강대 AAT3024/MAS1004 8개 PDF(선형대수, 회귀, 분류, intrinsic interpretability, Breiman "Two Cultures" 논문)는 2026-09-08 세션에서 상세히 읽고 요약함 — 필요시 해당 대화 기록 참고.
