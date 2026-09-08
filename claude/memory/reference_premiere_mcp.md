---
name: reference_premiere_mcp
description: 프리미어 프로 MCP 셋업(leancoderkavy premiere-pro-mcp) + 노션 라벨 TC를 프리미어에 붙일 때 4블록 SMPTE 형식 해법
metadata: 
  node_type: memory
  type: reference
  originSessionId: 63bb6e47-dff0-44e8-a1f7-9684ac3974cd
---

# 프리미어 프로 MCP 셋업 + TC 형식 해법 (2026-06-24)

영상 라벨/마커를 Claude가 프리미어 타임라인에 직접 박기 위한 셋업. (아드 편집 — [[project_seongman_ep5]])

## 선택한 MCP = leancoderkavy `premiere-pro-mcp`
- **Node only**(npm 글로벌), macOS 지원, CEP/ExtendScript, **269 tools**, 마커(시퀀스/클립) 지원. file-based IPC.
- 후보 비교: antipaster=Windows 전용(❌), ayushozha=Go+Rust+Python 모노레포(과중, ❌). leancoderkavy가 가장 가벼움.
- ⚠️ 공식 지원은 Premiere 2025+ (2026 명시 X). CEP라 2026 시도 가치 있음. 안 되면 대안 탐색.

## 설치 완료 (유저 맥, 2026-06-24)
1. `npm install -g premiere-pro-mcp` (경로: `/opt/homebrew/bin/premiere-pro-mcp`)
2. `premiere-pro-mcp --install-cep` → CEP 패널 symlink + 디버그 모드 자동(CSXS 8–14)
3. `claude mcp add --scope user premiere --env PREMIERE_TEMP_DIR=/tmp/premiere-mcp-bridge -- premiere-pro-mcp` → `✔ Connected` (`~/.claude.json`)
   - ⚠️ `--env`는 variadic이라 name(premiere)을 먼저 두고 `--env` 그다음, command는 `--` 뒤에.
4. temp dir 폴더 생성: `mkdir -p /tmp/premiere-mcp-bridge` (둘이 공유하는 우편함)

## 사용 절차 (매번)
1. **Premiere Pro 2026 재시작** (CEP 패널 인식)
2. `Window → Extensions → MCP Bridge` → **Temp Directory에 `/tmp/premiere-mcp-bridge` 입력** → `Save Config` → `Start Bridge` → 🟢 **Running — polling** 확인
3. 작업 시퀀스 열기
4. **Claude Code 새 세션** (등록된 premiere 도구는 세션 시작 시 로드)
- ⚠️ 2026에서 패널 뜸 확인(2026-06-24). 단 로그에 `Could not detect Premiere Pro version` 경고 + `existsSync` 에러 뜨지만 **Bridge는 Running 됨**(폴더 미리 만들어서 무해). 실제 명령(마커 등) 되는지는 새 세션에서 1개 테스트로 검증 필요 — 미검증 상태.
- 연결 체인: Claude(새 세션) ─stdio→ premiere-pro-mcp ─파일IPC→ MCP Bridge 패널 → Premiere
- ⚠️ 진짜 "동시 백그라운드 작업"은 불가(Premiere 단일 인스턴스/스레드, ExtendScript는 활성 시퀀스 기준). 마커 일괄 주입은 수 초짜리 "끼어들기 배치"라 충분.

## ★TC 형식 해법 (유저 검증: 잘 작동, 2026-06-24)
- **노션 라벨 TC를 프리미어 복붙용으로 줄 때 반드시 4블록 SMPTE `HH:MM:SS:FF`.**
- 3블록(`분:초`, 예 `00:11:08`)은 프리미어가 오해석 → 위치 안 맞음. 4블록(`00:11:08:00`)이면 TC 입력란에서 정확히 점프.
- 스크립트/자막 TC가 초 단위면 프레임은 `:00`으로 채움 → 형식은 맞고 위치 ±1초. 프레임 정밀도는 프리미어에서 한 컷 찍어 보정(오프셋/fps 확인).
- → [[project-american-dream-ip]]의 라앵 "프리미어 TC 불일치" 숙제의 부분 해법.
