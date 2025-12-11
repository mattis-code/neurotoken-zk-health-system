from src.orchestrator.orchestrator import orchestrate_proof

def test_orchestrator_py():
    out = orchestrate_proof({"a": 1})
    assert "proofHash" in out
    assert out["metadata"]["serializedLength"] > 0
