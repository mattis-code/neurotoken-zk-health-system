"""
Domain Entities — Python Edition
"""

class ProgressEvent:
    def __init__(self, user_id, delta, timestamp):
        self.user_id = user_id
        self.delta = delta
        self.timestamp = timestamp

class HealthScore:
    def __init__(self, value: float):
        self.value = value

class RehabMilestone:
    def __init__(self, step: int, completed: bool):
        self.step = step
        self.completed = completed

class UserProfile:
    def __init__(self, user_id: str, region: str):
        self.user_id = user_id
        self.region = region

class ZKProofEnvelope:
    def __init__(self, proof_hash: str, metadata: dict):
        self.proof_hash = proof_hash
        self.metadata = metadata
