#!/bin/bash
# EO Channel RSS Monitor — 새 영상 감지 → 자막 추출 → Claude 자동 분석

RSS_URL="https://www.youtube.com/feeds/videos.xml?channel_id=UClWTCPVi-AU9TeCN6FkGARg"
BASE_DIR="$HOME/.claude/eo-thinking-mode"
SEEN_FILE="$BASE_DIR/seen-videos.txt"
LOG_DIR="$BASE_DIR/scan-logs"
LOG_FILE="$LOG_DIR/$(date +%Y%m%d).log"
CLAUDE_BIN="/opt/homebrew/bin/claude"
YTDLP_BIN="/opt/homebrew/bin/yt-dlp"

mkdir -p "$LOG_DIR"
touch "$SEEN_FILE"

echo "$(date '+%Y-%m-%d %H:%M:%S') [RSS] EO 채널 스캔 시작" >> "$LOG_FILE"

# RSS 피드 파싱 (python3으로 XML 처리)
NEW_VIDEOS=$(python3 - <<'PYEOF'
import urllib.request, xml.etree.ElementTree as ET, sys

url = "https://www.youtube.com/feeds/videos.xml?channel_id=UClWTCPVi-AU9TeCN6FkGARg"
try:
    with urllib.request.urlopen(url, timeout=30) as r:
        data = r.read()
except Exception as e:
    print(f"ERROR: {e}", file=sys.stderr)
    sys.exit(1)

ns = {
    'atom': 'http://www.w3.org/2005/Atom',
    'yt': 'http://www.youtube.com/xml/schemas/2015',
}

root = ET.fromstring(data)
for entry in root.findall('atom:entry', ns):
    vid_id = entry.find('yt:videoId', ns).text
    title_el = entry.find('atom:title', ns)
    title = title_el.text if title_el is not None else "Unknown"
    published_el = entry.find('atom:published', ns)
    published = published_el.text[:10] if published_el is not None else "unknown"
    # Escape pipes in title
    title_clean = title.replace('|', '-').replace('\n', ' ').strip()
    print(f"{vid_id}|{title_clean}|{published}")
PYEOF
)

if [ -z "$NEW_VIDEOS" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] RSS 피드 가져오기 실패" >> "$LOG_FILE"
    exit 1
fi

PROCESSED=0

while IFS='|' read -r VIDEO_ID TITLE PUBLISHED; do
    [ -z "$VIDEO_ID" ] && continue

    # 이미 처리된 영상 건너뜀
    if grep -qF "$VIDEO_ID" "$SEEN_FILE"; then
        continue
    fi

    echo "$(date '+%Y-%m-%d %H:%M:%S') [NEW] $VIDEO_ID — $TITLE ($PUBLISHED)" >> "$LOG_FILE"

    YT_URL="https://www.youtube.com/watch?v=$VIDEO_ID"
    WORK_DIR="/tmp/eo-$VIDEO_ID"
    mkdir -p "$WORK_DIR"

    # yt-dlp로 자막 추출 (영어 우선, 한국어 폴백)
    "$YTDLP_BIN" \
        --skip-download \
        --write-auto-sub \
        --sub-lang "en,ko" \
        --convert-subs txt \
        -o "$WORK_DIR/sub" \
        "$YT_URL" >> "$LOG_FILE" 2>&1

    # 자막 파일 찾기 (영어 우선)
    SUBTITLE_FILE=$(ls "$WORK_DIR"/*.en.txt 2>/dev/null | head -1)
    if [ -z "$SUBTITLE_FILE" ]; then
        SUBTITLE_FILE=$(ls "$WORK_DIR"/*.txt 2>/dev/null | head -1)
    fi

    if [ -z "$SUBTITLE_FILE" ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') [SKIP] 자막 없음: $VIDEO_ID" >> "$LOG_FILE"
        echo "$VIDEO_ID" >> "$SEEN_FILE"
        rm -rf "$WORK_DIR"
        continue
    fi

    # 자막 정제 (타임스탬프·빈 줄 제거, 8000자 제한)
    CLEAN_TRANSCRIPT=$(grep -v "^[0-9]" "$SUBTITLE_FILE" | grep -v "^$" | tr '\n' ' ' | cut -c1-8000)

    # 파일명용 슬러그 생성
    SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -dc 'a-z0-9-' | cut -c1-50)

    # Claude 분석 실행
    "$CLAUDE_BIN" -p "EO The Thinking Mode 채널의 새 영상을 분석하라.

영상 ID: $VIDEO_ID
제목: $TITLE
업로드일: $PUBLISHED
URL: $YT_URL

자막:
$CLEAN_TRANSCRIPT

---
다음 작업을 순서대로 수행하라:

1. 인물 프로필 파악 (게스트 이름, 소속, 경력 핵심)
2. 핵심 주장 3-5개 정리
3. TTM 채점 (각 항목 20점 만점, 총 100점):
   - ① 훅/제목 강도: 제목의 urgency/curiosity gap, 첫 발언 반직관성
   - ② 주제 참신성: TTM만의 앵글, 기존 담론과의 차별성
   - ③ 게스트 전문성·캐릭터: 권위 + 에너지 + 독자적 세계관
   - ④ TTM Vertical 적합성: THINK/WORK/POWER/HUMAN 연결
   - ⑤ 바이럴 포텐셜: 공유 동기, 클릭베이트 없이 퍼지는 힘
   - 총점 /100 및 한 줄 근거

4. ~/.claude/eo-thinking-mode/ttm-video-scores.md 채점 테이블에 행 추가
   (기존 순위 고려해서 적절한 위치에 삽입, Edit 도구 사용)
   형식: | [순위] | [게스트명] | [영상제목 축약] | [뷰수 또는 날짜] | [①] | [②] | [③] | [④] | [⑤] | **[총점]** |

5. TTM IP 관련 새 인사이트가 있으면 ~/.claude/eo-thinking-mode/shared-insights.md 에 추가

6. 분석 결과를 ~/.claude/eo-thinking-mode/research/${SLUG}.md 에 저장
   (drew-bent-analysis.md 포맷 참고)" \
        --allowedTools "Read,Write,Edit" \
        >> "$LOG_FILE" 2>&1

    echo "$VIDEO_ID" >> "$SEEN_FILE"
    rm -rf "$WORK_DIR"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [DONE] 분석 완료: $VIDEO_ID" >> "$LOG_FILE"

    PROCESSED=$((PROCESSED + 1))
    # 연속 분석 시 Rate limit 방지
    [ $PROCESSED -gt 0 ] && sleep 10

done <<< "$NEW_VIDEOS"

echo "$(date '+%Y-%m-%d %H:%M:%S') [RSS] 스캔 완료 (신규 처리: ${PROCESSED}개)" >> "$LOG_FILE"
