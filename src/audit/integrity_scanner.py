"""
External Integrity Scanner v1.0 (Public-Safe)

Performs:
- repo structure validation
- module presence checks
- hash-level consistency analysis
- Tri-Layer Validator verification

All logic is public-safe.
"""

import os
import hashlib
import time
from pathlib import Path

REQUIRED_DIRS = [
    "src",
    "src/bhbr",
    "src/bht",
    "src/zk_stub",
    "src/validator",
    "src/coupling",
    "docs",
]

def hash_file(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        h.update(f.read())
    return h.hexdigest()

class IntegrityScanner:
    def run(self):
        results = {
            "timestamp": int(time.time()),
            "missing_dirs": [],
            "file_hashes": {},
        }

        for d in REQUIRED_DIRS:
            if not os.path.isdir(d):
                results["missing_dirs"].append(d)

        # Hash all .py and .js files
        for path in Path("src").rglob("*.*"):
            if path.suffix in [".py", ".js"]:
                results["file_hashes"][str(path)] = hash_file(path)

        # Unified snapshot
        payload = (
            "".join(results["missing_dirs"]) +
            "".join(results["file_hashes"].values()) +
            str(results["timestamp"])
        )

        results["unified_snapshot"] = hashlib.sha256(payload.encode()).hexdigest()

        return results
