---
name: reference_fcpxml_caption_extraction
description: 파이널컷 프로 Captions 롤(라벨링)을 절대 타임코드와 함께 추출하는 방법 — .fcpxmld 파싱 기법
metadata: 
  node_type: memory
  type: reference
  originSessionId: 46aa54bf-fe27-41c4-90b5-e287769153e8
  modified: 2026-07-22T02:31:09.411Z
---

유저가 파이널컷 프로 라이브러리에서 Captions 롤로 원본 소스에 라벨(챕터/토픽 관찰노트)을 달아두는 경우가 있음. 이걸 노션 등으로 옮기고 싶을 때 쓰는 방법.

## 파일 위치
`.fcpxmld`는 패키지(디렉토리)이고 실제 XML은 그 안의 `Info.fcpxml`. Read/Bash로 열 때 패키지 경로가 아니라 `.../XXX.fcpxmld/Info.fcpxml`까지 지정해야 함.

## 여러 캡션 롤 구분 필수
한 프로젝트에 캡션 롤이 여러 개 있을 수 있음 (예: `iTT-Caption` = 자동 STT 대사 자막 다량, `iTT 3` 같은 커스텀 이름 롤 = 유저가 직접 단 챕터/토픽 라벨 소수). `grep -o 'role="[^"]*"'`로 몇 개 롤이 있는지, 각각 몇 개인지 먼저 세어보고 유저에게 어떤 롤이 "라벨링"인지 확인하거나 내용(짧은 대사 vs 챕터 제목 형태)으로 판별. 이름이 길고 문어체 요약형이면 라벨 롤, 대사 그대로면 자막 롤.

## 절대 타임코드 계산 (핵심 함정)
FCPXML은 중첩 구조라 `offset` 속성이 항상 시퀀스 전체 기준이 아니라 **부모 클립의 로컬 좌표계** 기준. 캡션이 `mc-clip`/`asset-clip` 안에 lane으로 들어있으면:
```
절대_offset = 부모의_절대_offset + (캡션.offset - 부모.start)
```
`start` 속성이 없으면 0으로 취급. xml.etree.ElementTree로 spine부터 재귀적으로 내려가면서 이 누적을 계산해야 정확함. offset/start/duration은 모두 `"1234/24000s"` 같은 분수 문자열이라 `fractions.Fraction`으로 파싱.

## 타임코드 포맷 변환
`FFVideoFormat1080p2398`(frameDuration `1001/24000s`, tcFormat NDF)처럼 23.976fps 소스는 표시상 명목 24fps로 프레임 번호(0~23)를 매김: `frame = round(seconds * 24000/1001)`, 그 프레임수를 24로 나눠서 HH:MM:SS:FF 조립. [[project_pensive_ep6]]에서 다룬 프리미어 0.1% 드리프트 보정과는 별개 문제 — 이건 FCPXML 원본 TC 계산이고, 프리미어로 반입한 뒤 오프셋이 생기면 그건 또 별도로 확인 필요.

## 출력
유저는 보통 노션 페이지에 `TC | 라벨` 2열 테이블로 받는 걸 선호 (이모지 없이, 표 형태) — [[feedback_notion_style]] 참고. 새 페이지를 만들기보다 관련 프로젝트 아래 이미 만들어둔 빈 페이지(예: "라벨링 정리")가 있는지 먼저 검색해서 채우는 걸 우선.
