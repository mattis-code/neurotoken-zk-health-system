#!/bin/bash

echo "🌐 SCRIPT 21 — Deploying Developer Portal to GitHub Pages …"

############################################
# 1. OPPRETT PAGES-KONFIG (docs/)
############################################

cat > docs/index.html << 'EOT'
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="refresh" content="0; URL=developer-portal/index.html" />
</head>
<body>
Redirecting to Developer Portal…
</body>
</html>
EOT

echo "📁 index.html lagt til i /docs"

############################################
# 2. LAG GITHUB PAGES KONFIGFIL
############################################

mkdir -p .github
mkdir -p .github/workflows

cat > .github/workflows/pages.yml << 'EOT'
name: Deploy GitHub Pages

on:
  push:
    branches:
      - master

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Pages
        uses: actions/configure-pages@v4

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: docs

  deploy:
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        uses: actions/deploy-pages@v4
EOT

echo "⚙️ GitHub Pages workflow lagt til"

############################################
# 3. COMMIT + PUSH
############################################

git add docs/index.html .github/
git commit -m "SCRIPT 21 — GitHub Pages Deployment for Developer Portal"
git push

echo "🚀 GitHub Pages deployment-file pushed"

############################################
# 4. GI BRUKER INFO
############################################

echo "🌍 Når Actions workflow har kjørt ferdig, blir Developer Portal live på:"
echo "https://mattis-code.github.io/neurotoken-zk-health-system/developer-portal/"
