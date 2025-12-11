# NeuroToken ZK System — Hashing Module (Python)
# Public-safe placeholder using SHA-256.

import hashlib

def nt_hash(inputs):
    if not isinstance(inputs, list):
        raise ValueError("inputs must be list")
    data = "|".join([str(x) for x in inputs])
    return hashlib.sha256(data.encode()).hexdigest()
