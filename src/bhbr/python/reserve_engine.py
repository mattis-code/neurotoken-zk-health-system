import time
import hashlib

class BHBRReserve:
    """
    Bitcoin-backed reserve model.
    Public-safe version — no private keys, no on-chain binding.
    Ensures deterministic, audit-friendly behavior.
    """

    def __init__(self, initial_btc=0.0):
        self.btc = float(initial_btc)
        self.last_update = time.time()

    def deposit(self, amount):
        amount = float(amount)
        self.btc += amount
        self.last_update = time.time()
        return {"status": "ok", "new_balance": self.btc}

    def withdraw(self, amount):
        amount = float(amount)
        if amount > self.btc:
            return {"status": "error", "reason": "insufficient_reserve"}

        self.btc -= amount
        self.last_update = time.time()
        return {"status": "ok", "new_balance": self.btc}

    def integrity_hash(self):
        payload = f"{self.btc}-{self.last_update}"
        return hashlib.sha256(payload.encode()).hexdigest()

    def snapshot(self):
        return {
            "btc_balance": self.btc,
            "last_update": self.last_update,
            "integrity_hash": self.integrity_hash()
        }
