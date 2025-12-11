#!/bin/bash

echo "🚨 SCRIPT 25 — STARTING ENTERPRISE CLEANUP"

###############################################
# 1. REMOVE OLD WHITEPAPERS
###############################################
rm -f whitepapers/BHBR_Public_Whitepaper.md
rm -f whitepapers/BHT_Public_Whitepaper.md
rm -f whitepapers/NeuroToken_ZK_Light_Whitepaper.md

echo "✔ Fjernet gamle whitepapers"

###############################################
# 2. REMOVE EMPTY FILES & PLACEHOLDERS
###############################################
find . -type f -empty -print -delete
find . -name ".keep" -delete

echo "✔ Fjernet tomme filer og gamle placeholders"

###############################################
# 3. REMOVE OLD DOCS
###############################################
rm -f docs/old_*.md
rm -f docs/deprecated_*.md

echo "✔ Renset docs/"

###############################################
# 4. SYNC README to v2.0
###############################################
cat > README.md << 'EOT'
# NeuroToken ZK Health System — v2.0

This repository contains the public-safe,
fully documented version of the Lionking Biotech
Health Economy Architecture:

- BHBR — Reserve Layer
- BHT — Utility Layer
- ZK Light Engine — Proof Layer
- Developer Portal
- APIs
- Roadmap v2.0

All documentation is now aligned with
Whitepapers v2.0 (2026).
EOT

echo "✔ README oppdatert"

###############################################
# 5. GIT COMMIT + PUSH
###############################################
git add .
git commit -m "Enterprise Cleanup — Remove legacy files + sync documentation v2.0"
git push

echo "🎯 SCRIPT 25 FULLFØRT — REPOET ER NÅ PROFESJONELT OG RENT"
