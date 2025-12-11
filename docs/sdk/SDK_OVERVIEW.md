# NeuroToken ZK Health System™ — SDK Overview

The SDK provides high-level tools for integrating with:
- ZK Light Engine
- Hashing + serialization utilities
- Orchestrator
- Domain validation
- Web3/BHBR/BHT interactions (public-safe)
- Sync + Telemetry

## Available SDKs
- **Python SDK** — `/src/sdk/python/client.py`
- **JavaScript SDK** — `/src/sdk/js/client.js`

## Example Usage (Python)
```python
from sdk.python.client import NeuroTokenClient

client = NeuroTokenClient()
result = client.hash("hello")
print(result)
Example Usage (JavaScript)import { NeuroTokenClient } from "./sdk/js/client.js";

const client = new NeuroTokenClient();
console.log(client.hash("hello"));
Auto-generated API docs
	•	Python API: docs/api/auto/python/
	•	JS API: docs/api/auto/js/
