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
