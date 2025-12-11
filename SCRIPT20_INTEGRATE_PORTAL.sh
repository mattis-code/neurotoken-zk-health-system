#!/bin/bash

echo "🔗 SCRIPT 20 — Integrating Developer Portal into README + Website …"

############################################################
# 1. Oppdater README.md
############################################################

cat > README.md << 'EOT'
# NeuroToken ZK Health System™ — Public Repository

Dette er det offentlige utviklings- og dokumentasjonsreposet for Lionking Biotech™ sin
kjerneinfrastruktur for digital rehabilitering, ZK-baserte verifiseringslag,
og Web3-integrert helseøkonomi.

---

# 🔗 Developer Portal
Full utviklerportal for systemet ligger her:

👉 **https://github.com/mattis-code/neurotoken-zk-health-system/tree/master/docs/developer-portal**

## Hurtiglenker:
- Getting Started  
  `docs/developer-portal/getting-started.html`
- SDK Documentation  
  `docs/developer-portal/sdk.html`
- ZK Light Engine  
  `docs/developer-portal/zk-engine.html`
- Web3 Integration (Bitcoin + EVM + Bridge)  
  `docs/developer-portal/web3.html`
- Whitepapers  
  `docs/developer-portal/whitepapers.html`
- Architecture Overview  
  `docs/developer-portal/architecture.html`
- Roadmap 2026–2029  
  `docs/developer-portal/roadmap.html`
- Contribute Guide  
  `docs/developer-portal/contribute.html`
- Legal & Licensing  
  `docs/developer-portal/legal.html`

---

# 🧠 System Overview
Systemet inkluderer:
- ZK-Light Engine
- Bitcoin Reserve Layer (BHBR)
- Utility Token Layer (BHT)
- Web3 Bridge & Routing
- SDK (JS + Python)
- Architecture & Governance Framework
- Roadmap 2026–2029
- Full Developer Portal

---

# 📂 Directory Structure
docs/
developer-portal/
roadmap-no.html
roadmap.html
src/
zk_engine/
web3/
sdk/
whitepapers/
scripts/
tests/
examples/---

# 🤝 Contributing
Pull requests er velkomne på ikke-sensitive deler.
Sensitive komponenter utvikles internt og er ikke åpne.

---

# 🏛 License
MIT License – kun for public-safe deler.
EOT

echo "📘 README.md oppdatert med Developer Portal"

############################################################
# 2. Lag HTML-snippet for nettsiden
############################################################

mkdir -p website-snippets

cat > website-snippets/developer-portal-snippet.html << 'EOT'
<!-- Developer Portal integration for lionkingbiotech.com -->
<div class="portal-section">
  <h2>Developer Portal</h2>
  <p>
    Lionking Biotech™ tilbyr en komplett utviklerportal for 
    NeuroToken ZK Health System™, inkludert SDK, Web3-adaptere, 
    ZK Light Engine-dokumentasjon, og full roadmap.
  </p>

  <a href="https://github.com/mattis-code/neurotoken-zk-health-system/tree/master/docs/developer-portal" 
     class="cta-button">Open Developer Portal</a>
</div>
EOT

echo "🌐 Nettside-snippet generert: website-snippets/developer-portal-snippet.html"

############################################################
# 3. Commit + Push
############################################################

git add README.md website-snippets/
git commit -m "SCRIPT 20 — Integrated Developer Portal in README + Website Snippet"
git push

echo "✅ SCRIPT 20 FULLFØRT — Developer Portal integrert"
