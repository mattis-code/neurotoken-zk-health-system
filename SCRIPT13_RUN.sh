#!/bin/bash
echo "🧠 SCRIPT 13 — AGGREGATION + ORCHESTRATION + SYNC ENGINE START"

############################################################
# 1. Aggregation Layer
############################################################
mkdir -p src/aggregation

cat > src/aggregation/aggregation.js << 'EOT'
/**
 * Aggregation Layer — JS Edition
 */

export function aggregateProgress(events) {
  return events.reduce((a, e) => a + e.delta, 0);
}

export function aggregateHealthScores(scores) {
  return scores.reduce((a, s) => a + s.value, 0) / scores.length;
}

export function trackMilestones(milestones) {
  return milestones.filter(m => m.completed).length;
}
EOT

cat > src/aggregation/aggregation.py << 'EOT'
"""
Aggregation Layer — Python Edition
"""

def aggregate_progress(events):
    return sum(e.delta for e in events)

def aggregate_health_scores(scores):
    return sum(s.value for s in scores) / len(scores)

def track_milestones(milestones):
    return len([m for m in milestones if m.completed])
EOT



############################################################
# 2. ZK Orchestrator
############################################################
mkdir -p src/orchestrator

cat > src/orchestrator/orchestrator.js << 'EOT'
import { ntHash } from "../zk/hashing.js";
import { ntSerialize } from "../zk/serialization.js";

/**
 * ZK Orchestrator — JS (public-safe mock)
 */
export function orchestrateProof(input) {
  const serialized = ntSerialize(input);
  const proofHash = ntHash([serialized.length]);
  return {
    proofHash,
    metadata: { serializedLength: serialized.length }
  };
}
EOT

cat > src/orchestrator/orchestrator.py << 'EOT'
from src.zk.serialization import nt_serialize
from src.zk.hashing import nt_hash

"""
ZK Orchestrator — Python Edition (safe mock)
"""

def orchestrate_proof(input_data):
    serialized = nt_serialize(input_data)
    proof_hash = nt_hash([len(serialized)])
    return {
        "proofHash": proof_hash,
        "metadata": {"serializedLength": len(serialized)}
    }
EOT



############################################################
# 3. Cross-Language Sync Engine
############################################################
mkdir -p src/sync

cat > src/sync/sync_engine.js << 'EOT'
/**
 * Sync Engine — JS Edition
 */

export function normalizeJSON(obj) {
  return JSON.stringify(obj, Object.keys(obj).sort());
}

export function compareOutputs(jsOutput, pyOutput) {
  return normalizeJSON(jsOutput) === normalizeJSON(pyOutput);
}
EOT

cat > src/sync/sync_engine.py << 'EOT'
"""
Sync Engine — Python Edition
"""
import json

def normalize_json(obj):
    return json.dumps(obj, sort_keys=True)

def compare_outputs(js_output, py_output):
    return normalize_json(js_output) == normalize_json(py_output)
EOT



############################################################
# 4. TESTS
############################################################
mkdir -p tests/orchestrator
mkdir -p tests/sync

# JS orchestrator test
cat > tests/orchestrator/test_orchestrator_js.test.js << 'EOT'
import { orchestrateProof } from "../../src/orchestrator/orchestrator.js";

test("orchestrator JS produces a proofHash", () => {
  const out = orchestrateProof({ a: 1 });
  expect(typeof out.proofHash).toBe("string");
  expect(out.metadata.serializedLength).toBeGreaterThan(0);
});
EOT

# Python orchestrator test
cat > tests/orchestrator/test_orchestrator_py.py << 'EOT'
from src.orchestrator.orchestrator import orchestrate_proof

def test_orchestrator_py():
    out = orchestrate_proof({"a": 1})
    assert "proofHash" in out
    assert out["metadata"]["serializedLength"] > 0
EOT

# Sync test
cat > tests/sync/test_sync.py << 'EOT'
from src.sync.sync_engine import compare_outputs

def test_compare_outputs():
    a = {"x": 1, "y": 2}
    b = {"y": 2, "x": 1}
    assert compare_outputs(a, b) is True
EOT



############################################################
# 5. DOCS
############################################################
mkdir -p docs/orchestrator

cat > docs/orchestrator/ORCHESTRATOR_OVERVIEW.md << 'EOT'
# ZK Orchestrator — Overview

The orchestrator coordinates:
- serialization
- hashing
- proof envelope generation
- domain → ZK bridging
- multi-language output parity

All logic is public-safe.
EOT



############################################################
# 6. GIT COMMIT + PUSH
############################################################
git add .
git commit -m "SCRIPT 13 — Aggregation Layer + Orchestrator + Sync Engine"
git push

echo "🧠 SCRIPT 13 COMPLETE — SYSTEM ORCHESTRATION INSTALLED"
