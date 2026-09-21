---
name: c-programming-study
description: 유저가 결석한 C 프로그래밍 수업 노션 자료 독학 복습 중 — 진행 현황 및 다음 세션 이어갈 지점
metadata: 
  node_type: memory
  type: project
  originSessionId: 5b9bddf1-3521-420f-9745-9a1f4fd5cefc
  modified: 2026-09-21T13:35:06.259Z
---

유저는 C 프로그래밍 수업에 결석해서 노션 강의자료로 혼자 복습 중.
강의자료: https://bronze-yarrow-a6c.notion.site/02-Type-Var-printf-adeae12323ca82fd9f7201b67606c86d ("02: Type, Var, printf()")

**Why:** 정규 수업을 못 들어서 다음 수업 전에 따라잡아야 함.

**진행 상황 (2026-09-21 기준):**
- 전체 페이지 내용 1차 요약 완료 — hello_world.c 구조 → bit/byte/이진수 → 변수 선언/초기화 → C 데이터 타입 → printf 포맷 지정자 → overflow → escape sequence → signed/unsigned 까지 노션 원문을 API로 직접 파싱해서 빠짐없이 정리해줌.
- Q&A로 깊게 다룬 개념: Python vs C vs C++ 차이(컴파일/인터프리터, 메모리 관리, 타입 시스템), bit의 물리적 의미(트랜지스터 on/off), 2진수·16진수 표기법 및 상호 변환(자릿값 원리 포함), "1byte=2^8"이 왜 틀린 표현인지(크기 vs 경우의 수 구분), char/int/float 타입별 byte 크기와 그 이유, C가 타입·메모리 크기를 직접 고려하게 만드는 이유와 그 장점(속도/메모리 효율/하드웨어 통제/예측가능성).
- 아직 실습(Practice 01~04 코드 직접 작성)은 진행 안 함 — 개념 이해 단계에서 멈춤.

**How to apply:** 다음 세션에서 이어갈 때:
1. 아직 안 다룬 나머지 개념(Data Types 표 세부, printf 포맷 지정자 %3.2f류 너비/정밀도, overflow 실습, escape sequence, signed/unsigned 심화 — %u 관련)에 대한 질문이 이어질 수 있음.
2. 개념 이해가 꽤 쌓였으니 이제 Practice 01~04를 직접 코드로 짜보게 유도하면 좋은 타이밍.
3. 설명 스타일: 초심자 눈높이, 개념마다 표/코드예시/비유 적극 활용, 유저가 먼저 직관적으로 추측한 걸 검증·교정해주는 방식이 잘 맞았음 (예: "256가지인데 왜 최댓값이 255야?", "1byte=2^8 맞아?" 같은 질문에 정확한 근거로 짚어준 게 효과적).
