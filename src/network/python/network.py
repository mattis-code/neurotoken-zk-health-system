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
