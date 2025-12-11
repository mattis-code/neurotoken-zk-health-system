#!/bin/bash
echo "📦 SCRIPT 10 — SDK LAYER START"

############################################################
# 1. JAVASCRIPT SDK
############################################################
mkdir -p src/sdk/js

cat > src/sdk/js/client.js << 'EOT'
/**
 * NeuroToken™ SDK (JavaScript)
 * Public-safe SDK for interacting with the NeuroToken ZK Health System™.
 */

import crypto from "crypto";

export class NeuroTokenClient {
  constructor(config = {}) {
    this.endpoint = config.endpoint || "https://api.neurotoken.example";
    this.apiKey = config.apiKey || null;
  }

  signPayload(payload) {
    const canonical = JSON.stringify(payload, Object.keys(payload).sort());
    return crypto.createHash("sha256").update(canonical).digest("hex");
  }

  async submitProgress(data) {
    return {
      ok: true,
      received: data,
      signature: this.signPayload(data),
      note: "Public-safe mocked endpoint"
    };
  }
}
EOT


############################################################
# 2. PYTHON SDK
############################################################
mkdir -p src/sdk/python

cat > src/sdk/python/client.py << 'EOT'
"""
NeuroToken™ SDK (Python)
Public-safe SDK for interacting with the NeuroToken ZK Health System™.
"""

import json
import hashlib

class NeuroTokenClient:
    def __init__(self, endpoint="https://api.neurotoken.example", api_key=None):
        self.endpoint = endpoint
        self.api_key = api_key

    def sign_payload(self, payload: dict) -> str:
        canonical = json.dumps(payload, sort_keys=True)
        return hashlib.sha256(canonical.encode()).hexdigest()

    def submit_progress(self, data: dict) -> dict:
        return {
            "ok": True,
            "received": data,
            "signature": self.sign_payload(data),
            "note": "Public-safe mocked endpoint"
        }
EOT


############################################################
# 3. JS EXAMPLE
############################################################
mkdir -p examples/js

cat > examples/js/sdk_example.js << 'EOT'
import { NeuroTokenClient } from "../../src/sdk/js/client.js";

const sdk = new NeuroTokenClient();

const result = await sdk.submitProgress({
  user: "demo",
  progress: 12,
});

console.log(result);
EOT


############################################################
# 4. PYTHON EXAMPLE
############################################################
mkdir -p examples/python

cat > examples/python/sdk_example.py << 'EOT'
from src.sdk.python.client import NeuroTokenClient

sdk = NeuroTokenClient()

response = sdk.submit_progress({
    "user": "demo",
    "progress": 12,
})

print(response)
EOT


############################################################
# 5. SDK DOCUMENTATION
############################################################
mkdir -p docs/sdk

cat > docs/sdk/SDK_OVERVIEW.md << 'EOT'
# NeuroToken™ SDK Overview

This SDK provides:
- Canonical payload signing
- Public-safe progress submission
- JS + Python parity
- Developer examples
- Lightweight, dependency-free structure

Not included:
- Private ZK logic
- Real proof-generation
- Sensitive orchestration

This SDK is suitable for:
- Prototyping
- Investor demos
- Early integrator onboarding
EOT


############################################################
# 6. TESTS (JS + PY)
############################################################
mkdir -p tests/sdk

cat > tests/sdk/test_js_client.test.js << 'EOT'
import { NeuroTokenClient } from "../../src/sdk/js/client.js";

test("JS SDK: signing works", () => {
  const sdk = new NeuroTokenClient();
  const sig = sdk.signPayload({ a: 1, b: 2 });
  expect(typeof sig).toBe("string");
  expect(sig.length).toBe(64);
});
EOT


cat > tests/sdk/test_python_client.py << 'EOT'
from src.sdk.python.client import NeuroTokenClient

def test_python_signing():
    sdk = NeuroTokenClient()
    sig = sdk.sign_payload({"a": 1, "b": 2})
    assert isinstance(sig, str)
    assert len(sig) == 64
EOT


############################################################
# GIT COMMIT + PUSH
############################################################
git add .
git commit -m "SCRIPT 10 — Full SDK Layer (JS+Python), docs, examples, tests"
git push

echo "🎯 SCRIPT 10 COMPLETE — SDK LAYER INSTALLED"
