import hashlib
import time

class BHTEngine:
    """
    BHT (Brain Health Token™) — utility token engine.
    PUBLIC-SAFE VERSION.
    No private keys, no on-chain ops.
    """

    def __init__(self):
        self.total_supply = 0.0
        self.last_update = time.time()

    def mint(self, amount: float, reason: str = "unspecified"):
        amount = float(amount)
        self.total_supply += amount
        self.last_update = time.time()

        return {
            "status": "ok",
            "operation": "mint",
            "amount": amount,
            "reason": reason,
            "new_total_supply": self.total_supply,
            "integrity_hash": self.integrity_hash()
        }

    def burn(self, amount: float, reason: str = "unspecified"):
        amount = float(amount)

        if amount > self.total_supply:
            return {
                "status": "error",
                "reason": "insufficient_supply"
            }

        self.total_supply -= amount
        self.last_update = time.time()

        return {
            "status": "ok",
            "operation": "burn",
            "amount": amount,
            "reason": reason,
            "new_total_supply": self.total_supply,
            "integrity_hash": self.integrity_hash()
        }

    def integrity_hash(self):
        payload = f"{self.total_supply}-{self.last_update}"
        return hashlib.sha256(payload.encode()).hexdigest()

    def snapshot(self):
        return {
            "total_supply": self.total_supply,
            "last_update": self.last_update,
            "integrity_hash": self.integrity_hash()
        }

