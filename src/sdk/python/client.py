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
