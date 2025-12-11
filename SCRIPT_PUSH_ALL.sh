#!/bin/zsh

echo "🚀 PUSHING FULL REPO — FINAL SYNC"

# Sikrer at vi er i et git-repo
if [ ! -d .git ]; then
  echo "❌ ERROR: Du står ikke i et git-repo!"
  exit 1
fi

# Legg til ALT – absolutt alt
git add -A

# Commit
git commit -m "FINAL SYNC — All scripts, docs, whitepapers, SDK, orchestration, demo, domain layer, telemetry, network"

# Push
git push

echo "✅ FULL PUSH GJENNOMFØRT — ALT ER NÅ LIVE PÅ GITHUB"
