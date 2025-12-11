#!/bin/bash
echo "🚀 SCRIPT 5 — Building Full Docs Portal + GitHub Pages + API Reference"

############################################
# 1. CREATE DEVELOPER DOC PORTAL STRUCTURE
############################################
mkdir -p docs
mkdir -p docs/api
mkdir -p docs/guide
mkdir -p docs/specs

############################################
# 2. MAIN INDEX PAGE
############################################
cat > docs/index.md << 'EOT'
# NeuroToken ZK Health System™ — Developer Portal

Welcome to the official developer documentation for the NeuroToken ZK Health System™.

## Sections
- **Guide** — onboarding, architecture and workflow
- **API Reference** — JS + Python SDKs
- **ZK Engine Spec** — public-safe overview
- **Compliance & Governance** — transparent operations
- **Roadmap** — feature evolution

This documentation is auto-built and served via GitHub Pages.
EOT


############################################
# 3. DEVELOPER GUIDE
############################################
cat > docs/guide/overview.md << 'EOT'
# Developer Guide Overview

This guide provides:
- onboarding
- architecture walkthrough
- engine workflow
- integration patterns
- testing patterns
- contribution workflow
EOT

cat > docs/guide/onboarding.md << 'EOT'
# Developer Onboarding

1. Clone repo  
2. Install JS + Python deps  
3. Run tests  
4. Explore the engine  
5. Build integrations  
EOT


############################################
# 4. API REFERENCE (JS + PYTHON)
############################################
cat > docs/api/js.md << 'EOT'
# JavaScript SDK — API Reference

## Functions
### initEngine(config)
Initializes a ZK-safe engine instance.

### submitSignal(signal)
Submits hashed progress signal.

### generateProof(session)
Creates a zero-knowledge proof.

### verifyProof(proof)
Verifies proof validity.
EOT

cat > docs/api/python.md << 'EOT'
# Python SDK — API Reference

## Classes

### NeuroTokenClient(config)
Python client wrapper.

#### send_signal(signal)
Hash + send progress.

#### generate_proof(session)
Create ZK proof.

#### verify_proof(proof)
Validate provided proof.
EOT


############################################
# 5. SPECS
############################################
cat > docs/specs/zk_engine.md << 'EOT'
# ZK Engine Specification (Public-Safe)

This is a high-level representation of the ZK engine pipeline.

1. Input hashing
2. Session state update
3. Witness generation
4. Constraint evaluation
5. Proof generation
6. Public verification key usage
EOT


############################################
# 6. ENABLE GITHUB PAGES
############################################
mkdir -p .github/workflows

cat > .github/workflows/pages.yml << 'EOT'
name: Deploy Docs

on:
  push:
    branches: [ "master" ]

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v4

    - name: Setup Pages
      uses: actions/configure-pages@v3

    - name: Upload docs
      uses: actions/upload-pages-artifact@v3
      with:
        path: docs

    - name: Deploy
      uses: actions/deploy-pages@v4
EOT


############################################
# 7. UPDATE README WITH DOCS LINK
############################################
cat >> README.md << 'EOT'

---

## 📘 Developer Documentation  
Available at:  
**https://mattis-code.github.io/neurotoken-zk-health-system/**

EOT


############################################
# 8. GIT COMMIT + PUSH
############################################
git add .
git commit -m "SCRIPT 5 — Full docs portal, API reference and GitHub Pages deploy added"
git push

echo "🎯 SCRIPT 5 COMPLETE — Full Developer Portal + Pages Deploy Enabled"
