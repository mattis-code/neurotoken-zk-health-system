# System Architecture (High Level)

Layers:

1. **Data & Events (off-chain)**
   - Clinical and non-clinical events captured in compliant environments
   - Data remains under control of health providers and/or platform operators
   - Only aggregated, minimised metrics leave the core health systems

2. **ZK Engine**
   - Translates progress metrics and protocol adherence into zero-knowledge proofs
   - Verifies that conditions for incentives are met without revealing underlying health data
   - Can run in secure enclaves or dedicated ZK services

3. **Token & Settlement Layer**
   - Separate from clinical systems
   - Can be configured to:
     - unlock funding tranches
     - allocate rewards to patients / families / communities
     - support philanthropic or public co-funding pools

4. **Governance & Policy Layer**
   - Defines who can onboard, verify and audit
   - Keeps the system aligned with medical ethics, financial regulation and data protection law
