#!/bin/bash
set -e
cd "$(dirname "$0")"

export PATH="$PWD/bin:$PATH"

if ! command -v python3 &> /dev/null; then
    echo "Missing python3"
    exit 1
fi

# Set up venv and install Python deps
if [ ! -d "venv" ]; then
    echo "Setting up virtual environment..."
    python3 -m venv venv
    source venv/bin/activate
    pip install -q flask yt-dlp
else
    source venv/bin/activate
fi

PORT="${PORT:-8899}"
export PORT

echo ""
echo "  ReClip is running at http://localhost:$PORT"
echo ""
python3 app.py
