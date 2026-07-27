#!/bin/zsh
# JTech Daily Brief — 로컬 실행기 (launchd가 매일 09:00 KST에 호출)
# Mac이 09:00에 잠들어 있었으면 launchd가 깨어난 직후 실행해줌 (catch-up).
# 하루 1회 발송 보장: 오늘 이미 성공했으면 즉시 종료.

set -u
JTECH_DIR="$HOME/.claude/jtech"
STAMP_FILE="$JTECH_DIR/last_success"
LOG_FILE="$JTECH_DIR/jtech.log"
PROMPT_FILE="$JTECH_DIR/prompt.txt"
TODAY=$(date +%Y-%m-%d)

mkdir -p "$JTECH_DIR"
echo "[$(date '+%F %T')] launchd fired" >> "$LOG_FILE"

# 이미 오늘 발송했으면 스킵 (중복 방지)
if [[ -f "$STAMP_FILE" ]] && [[ "$(cat "$STAMP_FILE")" == "$TODAY" ]]; then
  echo "[$(date '+%F %T')] already sent today, skip" >> "$LOG_FILE"
  exit 0
fi

# claude 실행 파일 위치 (launchd 환경엔 PATH가 거의 없음 — 후보 경로 순서대로 탐색)
CLAUDE_BIN=""
for c in "$(command -v claude 2>/dev/null)" \
         /opt/homebrew/bin/claude \
         "$HOME/.local/bin/claude" \
         "$HOME/.claude/local/claude" \
         /usr/local/bin/claude; do
  if [[ -n "$c" && -x "$c" ]]; then
    CLAUDE_BIN="$c"
    break
  fi
done
if [[ -z "$CLAUDE_BIN" ]]; then
  echo "[$(date '+%F %T')] ERROR: claude CLI not found" >> "$LOG_FILE"
  exit 1
fi

# claude(node)가 npm/node 등을 찾을 수 있게 PATH 보강
export PATH="/opt/homebrew/bin:/usr/local/bin:$HOME/.local/bin:$PATH"

# 헤드리스 실행: 뉴스 수집 → 브리프 작성 → 웹훅 POST 까지 프롬프트가 지시
# 일시적 API 장애(connection drop 등) 자가 복구: 최대 3회 시도, 실패 시 5분 대기 후 재시도
MAX_ATTEMPTS=3
RETRY_WAIT=300
STATUS=1
for attempt in $(seq 1 $MAX_ATTEMPTS); do
  echo "[$(date '+%F %T')] attempt $attempt/$MAX_ATTEMPTS" >> "$LOG_FILE"
  "$CLAUDE_BIN" -p "$(cat "$PROMPT_FILE")" \
    --allowedTools "Bash,Read,Write,WebFetch,WebSearch" \
    --max-turns 40 \
    >> "$LOG_FILE" 2>&1
  STATUS=$?
  [[ $STATUS -eq 0 ]] && break
  echo "[$(date '+%F %T')] attempt $attempt failed (exit $STATUS)" >> "$LOG_FILE"
  if [[ $attempt -lt $MAX_ATTEMPTS ]]; then
    sleep $RETRY_WAIT
  fi
done

if [[ $STATUS -eq 0 ]]; then
  echo "$TODAY" > "$STAMP_FILE"
  echo "[$(date '+%F %T')] SUCCESS" >> "$LOG_FILE"
else
  echo "[$(date '+%F %T')] FAILED after $MAX_ATTEMPTS attempts (exit $STATUS) — will retry on next wake" >> "$LOG_FILE"
  # 실패 알림: 같은 웹훅으로 짧은 경고 발송 (조용한 실패 방지)
  WEBHOOK_URL="$(grep -o 'https://hooks.slack.com/services/[A-Za-z0-9/]*' "$PROMPT_FILE" | head -1)"
  if [[ -n "$WEBHOOK_URL" ]]; then
    LAST_LOG="$(tail -3 "$LOG_FILE" | tr '\n' ' ' | cut -c1-300)"
    /usr/bin/python3 -c "
import json, subprocess, sys
msg = {'text': '<@U0A6U8EFX52> ⚠️ JTech 브리프 발송 실패 (exit $STATUS). Mac에서 \`tail ~/.claude/jtech/jtech.log\` 확인 필요. 마지막 로그: ' + sys.argv[1]}
subprocess.run(['curl', '-s', '-X', 'POST', '-H', 'Content-type: application/json', '-d', json.dumps(msg), '$WEBHOOK_URL'], timeout=30)
" "$LAST_LOG" >> "$LOG_FILE" 2>&1
    echo "[$(date '+%F %T')] failure alert sent" >> "$LOG_FILE"
  fi
fi
exit $STATUS
