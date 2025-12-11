"""
Economic State Hash Engine v1.0 (Public-Safe)

Aggregates:
- BHBR reserve state
- BHT token supply + internal counters
- ZK progress stub
- Tri-layer validator output

Produces:
- deterministic economic state hash
- timestamp snapshot
"""

import hashlib
import json
import time

class EconomicStateHashEngine:
    def __init__(self, bhbr, bht, zk, validator):
        self.bhbr = bhbr
        self.bht = bht
        self.zk = zk
        self.validator = validator

    def compute_state_hash(self):
        # Tri-layer validator snapshot
        tri = self.validator.evaluate(self.zk)

        payload = {
            "btc_reserve": float(self.bhbr.btc),
            "bht_supply": int(self.bht.totalSupply),
            "zk_score": float(tri["zk_score"]),
            "validator_hash": tri["unified_hash"],
            "timestamp": int(time.time())
        }

        raw = json.dumps(payload, sort_keys=True).encode()
        unified = hashlib.sha256(raw).hexdigest()

        return {
            "payload": payload,
            "state_hash": unified
        }
