#!/bin/bash
echo "🚀 SCRIPT 7 — Enterprise Release Pipeline"

############################################
# 1. INSTALL SEMANTIC RELEASE
############################################
npm install --save-dev semantic-release @semantic-release/git @semantic-release/changelog @semantic-release/github

echo "✔ Semantic-release installed"


############################################
# 2. ADD RELEASE CONFIG
############################################
cat > .releaserc << 'EOT'
{
  "branches": ["master"],
  "plugins": [
    "@semantic-release/commit-analyzer",
    "@semantic-release/release-notes-generator",
    [
      "@semantic-release/changelog",
      {
        "changelogFile": "CHANGELOG.md"
      }
    ],
    [
      "@semantic-release/git",
      {
        "assets": [
          "CHANGELOG.md",
          "package.json"
        ],
        "message": "chore(release): ${nextRelease.version} [skip ci]\n\n${nextRelease.notes}"
      }
    ],
    "@semantic-release/github"
  ]
}
EOT

echo "✔ .releaserc created"


############################################
# 3. GITHUB ACTIONS WORKFLOW
############################################
mkdir -p .github/workflows

cat > .github/workflows/release.yml << 'EOT'
name: Release Pipeline

on:
  push:
    branches:
      - master

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 20

      - name: Install deps
        run: npm install

      - name: Release
        env:
          GITHUB_TOKEN: \${{ secrets.GITHUB_TOKEN }}
        run: npx semantic-release
EOT

echo "✔ GitHub Actions pipeline added"


############################################
# 4. PYTHON WHEEL BUILDER (Optional Release Asset)
############################################
mkdir -p scripts

cat > scripts/build_python.sh << 'EOT'
#!/bin/bash
echo "Building python wheel..."
python3 -m pip install --upgrade build
python3 -m build
EOT

chmod +x scripts/build_python.sh


############################################
# 5. JS BUNDLE BUILDER
############################################
cat > scripts/build_js.sh << 'EOT'
#!/bin/bash
echo "Building JS bundle..."
mkdir -p dist
npx esbuild src/index.js --bundle --outfile=dist/neurotoken.js
EOT

chmod +x scripts/build_js.sh


############################################
# 6. GIT COMMIT + PUSH
############################################
git add .
git commit -m "SCRIPT 7 — Enterprise Release Pipeline Installed"
git push

echo "🎯 SCRIPT 7 COMPLETE — Release Pipeline Ready"
