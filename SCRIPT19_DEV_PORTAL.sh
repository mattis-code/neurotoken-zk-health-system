#!/bin/bash

echo "🚀 GENERATING DEVELOPER PORTAL …"

mkdir -p docs/developer-portal

############################################
# INDEX
############################################
cat > docs/developer-portal/index.html << 'EOT'
<h1>Developer Portal — NeuroToken ZK Health System™</h1>
<p>Welcome to the official developer portal for the Lionking Biotech™ ecosystem.</p>

<h2>Sections</h2>
<ul>
  <li><a href="getting-started.html">Getting Started</a></li>
  <li><a href="sdk.html">SDK Documentation</a></li>
  <li><a href="zk-engine.html">ZK-Light Engine</a></li>
  <li><a href="web3.html">Web3 Layer (Bitcoin + EVM + Bridge)</a></li>
  <li><a href="whitepapers.html">Whitepapers</a></li>
  <li><a href="architecture.html">Architecture Overview</a></li>
  <li><a href="roadmap.html">Roadmap 2026–2029</a></li>
  <li><a href="contribute.html">Contribute</a></li>
  <li><a href="legal.html">Legal & Licensing</a></li>
</ul>
EOT

############################################
# GETTING STARTED
############################################
cat > docs/developer-portal/getting-started.html << 'EOT'
<h1>Getting Started</h1>
<p>This guide provides the first steps to understand and use the NeuroToken ZK Health System™.</p>

<h2>Clone the repo</h2>
<pre>git clone https://github.com/mattis-code/neurotoken-zk-health-system.git</pre>

<h2>Install SDK (Public-Safe)</h2>
<pre>cd neurotoken-zk-health-system</pre>
<pre>npm install</pre>

<h2>Core Components</h2>
<ul>
  <li>ZK Light Engine</li>
  <li>Bitcoin Reserve Layer (BHBR)</li>
  <li>Utility Token Layer (BHT)</li>
  <li>Web3 Integration Layer</li>
  <li>SDK (JS + Python)</li>
</ul>
EOT

############################################
# SDK DOCS
############################################
cat > docs/developer-portal/sdk.html << 'EOT'
<h1>SDK Documentation</h1>
<p>SDK includes:</p>
<ul>
  <li>JavaScript SDK: <code>src/sdk/js/</code></li>
  <li>Python SDK: <code>src/sdk/python/</code></li>
</ul>

<h2>Public-safe methods</h2>
<ul>
  <li>createProofSimulation()</li>
  <li>verifyMockProof()</li>
  <li>hashRehabEvent()</li>
</ul>
EOT

############################################
# ZK ENGINE DOCS
############################################
cat > docs/developer-portal/zk-engine.html << 'EOT'
<h1>ZK-Light Engine (Public-Safe)</h1>
<p>This is the non-sensitive version of the ZK engine, showing how aggregation and validation logic works conceptually.</p>

<h2>Main Concepts</h2>
<ul>
  <li>Proof Simulation</li>
  <li>Aggregation</li>
  <li>Public-safe Orchestrator</li>
</ul>
EOT

############################################
# WEB3 DOCS
############################################
cat > docs/developer-portal/web3.html << 'EOT'
<h1>Web3 Integration Layer</h1>
<p>Public-safe documentation for Bitcoin, EVM, and Bridge components.</p>

<h2>Components</h2>
<ul>
  <li>Bitcoin Adapter</li>
  <li>EVM Adapter</li>
  <li>Cross-chain Bridge Router</li>
</ul>

<h2>Use Cases</h2>
<ul>
  <li>Non-custodial reserve linkage</li>
  <li>Utility token routing</li>
  <li>Reward engine triggered by ZK proofs</li>
</ul>
EOT

############################################
# WHITEPAPERS
############################################
cat > docs/developer-portal/whitepapers.html << 'EOT'
<h1>Whitepapers</h1>
<p>Public-safe v1.0 whitepapers:</p>

<ul>
  <li><a href="../whitepapers/BHBR_Public_Whitepaper.md">BHBR</a></li>
  <li><a href="../whitepapers/BHT_Public_Whitepaper.md">BHT</a></li>
  <li><a href="../whitepapers/NeuroToken_ZK_Light_Whitepaper.md">ZK Light Engine</a></li>
</ul>
EOT

############################################
# ARCHITECTURE
############################################
cat > docs/developer-portal/architecture.html << 'EOT'
<h1>Architecture Overview</h1>
<p>This describes the public-safe, high-level architecture of the Lionking Biotech ecosystem:</p>

<ul>
  <li>Hjernensprer.no™ (Digital Rehabilitation)</li>
  <li>BrainSays.com™ (Global Neuro-Insight Platform)</li>
  <li>BHBR™ — Bitcoin Reserve</li>
  <li>BHT™ — Utility Token</li>
  <li>ZK Engine</li>
  <li>Web3 Layer</li>
</ul>
EOT

############################################
# ROADMAP — LINKS TIL GENERERT HTML
############################################
cat > docs/developer-portal/roadmap.html << 'EOT'
<h1>Roadmap 2026–2029</h1>
<p>See full roadmap:</p>
<ul>
  <li><a href="../roadmap-no.html">Norsk versjon</a></li>
  <li><a href="../roadmap.html">English version</a></li>
</ul>
EOT

############################################
# CONTRIBUTE
############################################
cat > docs/developer-portal/contribute.html << 'EOT'
<h1>Contribute</h1>
<p>Public-safe contribution guide:</p>

<ul>
  <li>Pull requests welcome</li>
  <li>Open issues under proper labels</li>
  <li>No sensitive code is accepted in public repo</li>
</ul>
EOT

############################################
# LEGAL
############################################
cat > docs/developer-portal/legal.html << 'EOT'
<h1>Legal & Licensing</h1>
<p>MIT License applies to all public-safe code and documents.</p>
<p>Sensitive components exist only in private internal repositories.</p>
EOT

############################################
# GIT COMMIT + PUSH
############################################
git add docs/developer-portal/
git commit -m "SCRIPT 19 — Developer Portal Auto-Generated"
git push

echo "✅ SCRIPT 19 FULLFØRT — DEVELOPER PORTAL ER KLAR!"
