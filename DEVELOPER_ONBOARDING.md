# Developer Onboarding Guide — NeuroToken ZK Health System™
### v1.0 — Open Core Edition

---

## 1. Introduction
Welcome to the NeuroToken ZK Health System™ Open Core repository.

This project defines the publicly accessible, non-patent-sensitive foundation for a
**Bitcoin-anchored, privacy-preserving progress verification layer** for
behavioural and cognitive rehabilitation.

This onboarding guide explains:
- How the repository is structured
- What can be developed publicly
- How to use the SDK stubs
- How to run the examples
- How to contribute safely without accessing protected IP
- How to maintain cryptographic and privacy guarantees

This is a **non-clinical system** designed for early-stage research, prototyping and
developer exploration.

---

## 2. Repository Structure/whitepapers/         — Satoshi-grade architectural papers (non-sensitive)
/docs/                — Public technical docs (architecture, dataflow, compliance)
/sdk/                 — SDK stubs for JS & Python
/examples/            — Minimal demo scripts (non-functional placeholders)
/tests/               — Basic structure for unit/integration tests
/security/            — Security disclosures (if expanded)**Important:**  
The repository intentionally contains **only safe, non-sensitive, non-proprietary code**.
No circuits, no state transition logic, no cryptographic parameters, and no token economics are stored here.

---

## 3. What Developers *Can* Work On

Developers can safely contribute to:

### ✔ SDKs  
- Client stubs  
- Serialization utilities  
- Hashing helpers  
- API wrappers  
- Transport abstractions  

### ✔ Documentation  
- Architecture summaries  
- Dataflow diagrams  
- Compliance overviews  
- Developer FAQs  

### ✔ Testing  
- Unit test frameworks  
- Integration test placeholders  

### ✔ Examples  
- Local client pseudo-code  
- Proof request simulations  
- JSON-based mock flows  

All of this is **safe** and does not interfere with protected IP.

---

## 4. What Developers *Cannot* Work On

To protect intellectual property and regulatory positioning, developers must **not** contribute:

### ❌ ZK circuits  
### ❌ Proof systems  
### ❌ State transition rules  
### ❌ Recovery scoring logic  
### ❌ Token issuance logic  
### ❌ Any medical, biometric or personal data model  

These elements are part of the **private Core Repository**, not included here.

---

## 5. Running Examples

### Pythoncd examples/client_playground
python3 python_client_example.py### JavaScriptcd examples/demo_progress_proof
node verify_demo.jsThese examples are **non-functional mockups**, designed only to illustrate structure.

---

## 6. SDK Overview

### Python SDKsdk/python/client_stub.py
sdk/utils/hashing.py### JavaScript SDKsdk/js/client_stub.js
sdk/utils/serialization.jsThese provide:
- request formatting  
- mock verification flows  
- crypto-safe placeholder hashing  
- serialization/deserialization stubs  

---

## 7. Security & Privacy Principles

The project follows strict principles:

### ✔ Zero personal data  
### ✔ Zero raw health metrics  
### ✔ Zero identifiers  
### ✔ Local-only pre-processing  
### ✔ ZK-only public computation  
### ✔ No stored sensitive data  

The interface layer must remain **minimal, deterministic and auditable**.

---

## 8. Contribution Workflow

1. Fork the repo  
2. Clone your fork  
3. Create a feature branch  
4. Ensure changes are limited to allowed areas  
5. Run tests  
6. Open a pull request  

All PRs undergo:
- security review  
- privacy review  
- compliance review  

---

## 9. Roadmap (Public Version)

### Q1–Q3 2026
- Strengthen SDK modelling & examples  
- Expand documentation library  
- Add cross-language bindings  
- Introduce structured test harness  
- Provide non-sensitive ZK educational material  

### Q4 2026–2027
- Offer integration examples for BHBR/BHT (mocked)  
- Publish developer playbooks  
- Expand resource directory  

---

## 10. Contact & Governance

Core Maintainer: **Lionking Biotech™**  
Public Repo Maintainer: **Mattis Bjørnsen (mattis-code)**  

For sensitive questions:  
**contact@lionkingbiotech.com**

