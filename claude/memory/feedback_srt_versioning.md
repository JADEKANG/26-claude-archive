---
name: feedback-srt-versioning
description: "SRT(자막/라벨 파일) 새로 만들 때 덮어쓰지 말고 파일명에 \"re\"를 계속 덧붙여 버전 보존"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 6d66b4c1-7dee-4afc-a4b5-fd32a4670058
---

조성만 등 라벨링 SRT를 새로 생성할 때 **기존 파일을 덮어쓰지 말 것.** 파일명에 `re`를 계속 추가로 붙여 새 파일로 만든다: `label_re.srt` → `label_re_re.srt` → `label_re_re_re.srt` …

**Why:** 제이드가 이전 버전을 보존하고 비교하고 싶어함. 덮어쓰면 직전 임포트본이 사라짐.

**How to apply:** SRT(및 유사 산출물) 재생성 시 항상 새 파일명. 기존 최신 파일명에 `_re` suffix 추가. 관련 작업: [[project-seongman-ep5]].
