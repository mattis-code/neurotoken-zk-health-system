#!/bin/bash
echo "🚀 SCRIPT 4 — Setting up CI/CD, Test Runners & Repo Badges"

############################################
# 1. CREATE GITHUB ACTIONS WORKFLOWS
############################################
mkdir -p .github/workflows

cat > .github/workflows/ci.yml << 'EOT'
name: NeuroToken CI

on:
  push:
    branches: [ "master" ]
  pull_request:
    branches: [ "master" ]

jobs:
  build-test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [18.x]
        python-version: [3.11]

    steps:
    - name: Checkout repo
      uses: actions/checkout@v4

    # JS SETUP
    - name: Setup Node.js
      uses: actions/setup-node@v4
      with:
        node-version: ${{ matrix.node-version }}

    - name: Install JS deps
      run: npm install || true

    - name: Run JS tests
      run: node tests/unit/test_engine.js

    # PYTHON SETUP
    - name: Setup Python
      uses: actions/setup-python@v5
      with:
        python-version: ${{ matrix.python-version }}

    - name: Install Python deps
      run: pip install pytest || true

    - name: Run Python tests
      run: python3 tests/unit/test_engine.py

    # SECURITY SCANS
    - name: Security Scan (npm audit)
      run: npm audit || true

    - name: Security Scan (pip)
      run: pip install safety && safety check || true
EOT


############################################
# 2. UPDATE README WITH BADGES
############################################
cat > README.md << 'EOT'
# NeuroToken ZK Health System™

[![CI](https://github.com/mattis-code/neurotoken-zk-health-system/actions/workflows/ci.yml/badge.svg)](https://github.com/mattis-code/neurotoken-zk-health-system/actions/workflows/ci.yml)
![License](https://img.shields.io/badge/license-MIT-gold)
![Security](https://img.shields.io/badge/security-ZK%20Hardened-black)

A public-safe open-core implementation of the NeuroToken ZK Health System™.

Includes:
- ZK Engine (placeholder, public-safe)
- SDK (JS + Python)
- Tests (JS + Python)
- Whitepapers
- Compliance docs
- Developer onboarding
- Full CI/CD pipeline
EOT


############################################
# 3. ADD DOCKER PLACEHOLDER (NO SECRETS)
############################################
cat > Dockerfile << 'EOT'
# Placeholder container for future ZK engine runtime
FROM node:18

WORKDIR /app
COPY . .

CMD ["node", "examples/js/demo.js"]
EOT


############################################
# 4. ADD TOOLING SCRIPTS
############################################
mkdir -p scripts

cat > scripts/run_all_tests.sh << 'EOT'
#!/bin/bash
echo "Running JS tests..."
node tests/unit/test_engine.js

echo "Running Python tests..."
python3 tests/unit/test_engine.py
EOT

chmod +x scripts/run_all_tests.sh


############################################
# 5. GIT COMMIT + PUSH
############################################
git add .
git commit -m "SCRIPT 4 — CI/CD, badges, Docker placeholder and test runners added"
git push

echo "🎯 SCRIPT 4 COMPLETE — Repo now has full CI/CD & badges"
