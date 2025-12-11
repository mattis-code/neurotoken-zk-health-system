#!/bin/bash
echo "🚀 SCRIPT 14 — FULL END-TO-END DEMO START"

############################################################
# 1. Create demo folder
############################################################
mkdir -p demo/js
mkdir -p demo/python
mkdir -p docs/demo

############################################################
# 2. JS Demo
############################################################
cat > demo/js/full_demo.js << 'EOT'
import { serializePayload } from "../../src/zk/serialization.js";
import { hashPayload } from "../../src/zk/hashing.js";
import { Orchestrator } from "../../src/orchestrator/orchestrator.js";
import { SyncEngine } from "../../src/sync/sync_engine.js";
import { Aggregator } from "../../src/aggregation/aggregation.js";

async function runDemo() {
  const input = { user: "demo", progress: 42 };

  const serialized = serializePayload(input);
  const hash = hashPayload(serialized);

  const orch = new Orchestrator();
  const sync = new SyncEngine();
  const agg = new Aggregator();

  const step1 = orch.process(serialized);
  const step2 = sync.sync(step1);
  const final = agg.aggregate([step1, step2], hash);

  console.log("FINAL OUTPUT:", final);
}

runDemo();
EOT

############################################################
# 3. Python Demo
############################################################
cat > demo/python/full_demo.py << 'EOT'
from src.zk.serialization import serialize_payload
from src.zk.hashing import hash_payload
from src.orchestrator.orchestrator import Orchestrator
from src.sync.sync_engine import SyncEngine
from src.aggregation.aggregation import Aggregator

def run_demo():
    input_data = {"user": "demo", "progress": 42}

    serialized = serialize_payload(input_data)
    hashed = hash_payload(serialized)

    orch = Orchestrator()
    sync = SyncEngine()
    agg = Aggregator()

    step1 = orch.process(serialized)
    step2 = sync.sync(step1)
    final = agg.aggregate([step1, step2], hashed)

    print("FINAL OUTPUT:", final)

if __name__ == "__main__":
    run_demo()
EOT

############################################################
# 4. Documentation
############################################################
mkdir -p docs/demo

cat > docs/demo/DEMO_OVERVIEW.md << 'EOT'
# End-to-End Demo Overview

This demo shows the full processing pipeline:

1. Input payload
2. Serialization
3. Hashing
4. Orchestrator processing
5. Sync engine propagation
6. Aggregation layer final output

Both JS and Python versions are included.
EOT

############################################################
# 5. Tests
############################################################
mkdir -p tests/demo

cat > tests/demo/test_demo_flow.py << 'EOT'
from demo.python.full_demo import run_demo

def test_demo_executes():
    run_demo()
    assert True
EOT

############################################################
# GIT COMMIT + PUSH
############################################################
git add .
git commit -m "SCRIPT 14 — Full End-to-End Demo Pipeline (JS + Python)"
git push

echo "🎯 SCRIPT 14 COMPLETE — END-TO-END DEMO INSTALLED"
