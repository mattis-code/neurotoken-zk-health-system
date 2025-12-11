#!/bin/bash

echo "🚀 SCRIPT 26 — Starting Whitepaper Sync + GitHub Pages Update"

############################################################
# 1. SYNC WHITEPAPERS v2.0 INTO DEVELOPER PORTAL
############################################################

mkdir -p docs/whitepapers

cp whitepapers/bhbr-whitepaper-v2.md docs/whitepapers/bhbr.md
cp whitepapers/bht-whitepaper-v2.md docs/whitepapers/bht.md
cp whitepapers/zk-light-whitepaper-v2.md docs/whitepapers/zk-engine.md

echo "✔ Whitepapers synced into Developer Portal"


############################################################
# 2. UPDATE DEVELOPER PORTAL INDEX
############################################################

cat > docs/whitepapers/index.md << 'EOT'
# Whitepapers — v2.0 (Public-Safe)

The following documents constitute the public-safe,
fully synchronized version of the Lionking Biotech 
Health Economy Architecture:

## • Brain Health Bitcoin Reserve (BHBR)
[Read BHBR v2.0](bhbr.md)

## • Brain Health Token (BHT)
[Read BHT v2.0](bht.md)

## • NeuroToken ZK-Light Engine
[Read ZK-Light Engine v2.0](zk-engine.md)

All documents aligned with:
- Roadmap v2.0
- Developer Portal v2.0
- Architecture Overview 2026
EOT

echo "✔ Whitepaper index updated"


############################################################
# 3. UPDATE README WHITEPAPER LINKS
############################################################

cat > README.md << 'EOT'
# NeuroToken ZK Health System — v2.0

This repository contains the public-safe, transparent,
documentation set of the Lionking Biotech Health Economy:

## Whitepapers v2.0
- **BHBR (Bitcoin Reserve Layer)**  
  👉 docs/whitepapers/bhbr.md  

- **BHT (Utility Layer)**  
  👉 docs/whitepapers/bht.md  

- **ZK-Light Engine (Zero-Knowledge Proof Layer)**  
  👉 docs/whitepapers/zk-engine.md  

## Developer Portal
👉 https://mattis-code.github.io/neurotoken-zk-health-system/developer-portal/

## Architecture
Includes modular design for:
- ZK Proof Generation
- Reserve Layer (BHBR)
- Utility Layer (BHT)
- SDKs (Python + JS)
- Security + Compliance

Updated automatically via SCRIPT 26.
EOT

echo "✔ README updated with v2 whitepapers"


############################################################
# 4. FORCE UPDATE GITHUB PAGES
############################################################

git add .
git commit -m "SCRIPT 26 — Whitepaper Sync + GitHub Pages Auto-Update"
git push

if gh pages --help > /dev/null 2>&1; then
    gh pages deploy --force --branch=gh-pages --dist=.
    echo "✔ GitHub Pages redeployed"
else
    echo "⚠ gh-pages CLI missing — but push completed (GitHub will auto-build)"
fi

echo "🎯 SCRIPT 26 FULLFØRT — Whitepapers synkronisert + Developer Portal oppdatert!"
