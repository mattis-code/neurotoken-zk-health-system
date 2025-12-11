#!/bin/bash
echo "🌐 SCRIPT 11 — NETWORK + TELEMETRY + ERROR MODEL START"

############################################################
# 1. NETWORK LAYER (JS)
############################################################
mkdir -p src/network/js

cat > src/network/js/network.js << 'EOT'
/**
 * NeuroToken™ Network Layer (JavaScript)
 * Public-safe request wrapper with telemetry + unified errors.
 */

import crypto from "crypto";

export class NTError extends Error {
  constructor(code, message, details = {}) {
    super(message);
    this.code = code;
    this.details = details;
  }
}

export class NetworkClient {
  constructor(config = {}) {
    this.timeout = config.timeout || 3000;
  }

  async request(path, payload) {
    const start = Date.now();

    try {
      await new Promise(res => setTimeout(res, 50)); // Mock latency

      const hash = crypto
        .createHash("sha256")
        .update(JSON.stringify(payload))
        .digest("hex");

      return {
        ok: true,
        latency: Date.now() - start,
        echo: payload,
        hash
      };
    } catch (err) {
      throw new NTError("NETWORK_ERROR", "Failed network operation", {
        original: err.message
      });
    }
  }
}
EOT


############################################################
# 2. NETWORK LAYER (Python)
############################################################
mkdir -p src/network/python

cat > src/network/python/network.py << 'EOT'
"""
NeuroToken™ Network Layer (Python)
Public-safe request wrapper with telemetry + unified errors.
"""

import hashlib
import json
import time

class NTError(Exception):
    def __init__(self, code, message, details=None):
        super().__init__(message)
        self.code = code
        self.details = details or {}

class NetworkClient:
    def __init__(self, timeout=3.0):
        self.timeout = timeout

    def request(self, path: str, payload: dict):
        start = time.time()

        try:
            time.sleep(0.05)  # Mock latency

            canonical = json.dumps(payload, sort_keys=True)
            hash_value = hashlib.sha256(canonical.encode()).hexdigest()

            return {
                "ok": True,
                "latency": round((time.time() - start) * 1000, 2),
                "echo": payload,
                "hash": hash_value
            }
        except Exception as e:
            raise NTError("NETWORK_ERROR", "Failed network operation", {"original": str(e)})
EOT


############################################################
# 3. TELEMETRY (JS)
############################################################
mkdir -p src/telemetry/js

cat > src/telemetry/js/telemetry.js << 'EOT'
/**
 * Local-only telemetry module (public safe)
 */
export class Telemetry {
  constructor() {
    this.events = [];
  }

  record(event, data = {}) {
    this.events.push({
      event,
      data,
      ts: Date.now()
    });
  }

  flush() {
    const batch = [...this.events];
    this.events = [];
    return batch;
  }
}
EOT


############################################################
# 4. TELEMETRY (Python)
############################################################
mkdir -p src/telemetry/python

cat > src/telemetry/python/telemetry.py << 'EOT'
"""
Local-only telemetry (public safe)
"""

import time

class Telemetry:
    def __init__(self):
        self.events = []

    def record(self, event: str, data=None):
        self.events.append({
            "event": event,
            "data": data or {},
            "ts": int(time.time()*1000)
        })

    def flush(self):
        batch = list(self.events)
        self.events.clear()
        return batch
EOT


############################################################
# 5. DOCUMENTATION
############################################################
mkdir -p docs/network

cat > docs/network/NETWORK_OVERVIEW.md << 'EOT'
# NeuroToken™ Network Layer & Error Model

This module provides:
- Unified error model (NTError)
- Typed error codes
- Request wrapper with latency measurement
- Local telemetry (safe for public repos)
- JS + Python parity

Error Codes:
- NETWORK_ERROR
- VALIDATION_ERROR
- INTERNAL_ERROR
EOT


############################################################
# 6. TESTS
############################################################
mkdir -p tests/network

cat > tests/network/test_network_py.py << 'EOT'
from src.network.python.network import NetworkClient

def test_network_request_ok():
    n = NetworkClient()
    res = n.request("/demo", {"x": 1})
    assert res["ok"] is True
    assert "hash" in res
EOT


cat > tests/network/test_network_js.test.js << 'EOT'
import { NetworkClient } from "../../src/network/js/network.js";

test("JS network request OK", async () => {
  const n = new NetworkClient();
  const res = await n.request("/demo", { x: 1 });
  expect(res.ok).toBe(true);
  expect(typeof res.hash).toBe("string");
});
EOT


############################################################
# 7. GIT COMMIT + PUSH
############################################################
git add .
git commit -m "SCRIPT 11 — Network Layer + Telemetry + Unified Error Model"
git push

echo "🌐 SCRIPT 11 COMPLETE — NETWORK & TELEMETRY INSTALLED"
