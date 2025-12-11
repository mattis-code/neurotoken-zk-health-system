from sdk.python.client import NeuroTokenClient

class Orchestrator:
    """
    High-level orchestrator for NeuroToken ZK Health System.
    Manages:
    - hashing
    - serialization
    - domain validation
    - future ZK proof flow integration
    """

    def __init__(self):
        self.client = NeuroTokenClient()

    def process(self, payload: dict):
        if not self.client.validate_domain(payload):
            raise ValueError("Invalid domain payload")
        
        serialized = self.client.serialize(payload)
        hashed = self.client.hash(serialized)
        
        return {
            "serialized": serialized,
            "hashed": hashed,
            "status": "OK",
            "zk_proof_placeholder": True
        }
