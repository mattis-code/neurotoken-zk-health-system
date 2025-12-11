class NeuroTokenClient:
    def __init__(self, endpoint):
        self.endpoint = endpoint
    def submit_progress(self, data):
        return {"status": "ok", "proof": "ZK_PROOF_PLACEHOLDER"}
