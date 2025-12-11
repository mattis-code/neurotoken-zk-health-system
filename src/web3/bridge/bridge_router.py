# Bridge Router (Python)
# Public-safe

class BridgeRouter:
    def __init__(self, bhbr, bht):
        self.bhbr = bhbr
        self.bht = bht

    def proof_mint(self, user: str, proof_score: float):
        reward = int(proof_score * 10)
        self.bht.mint(user, reward)
        return reward

    def convert_bht_to_btc(self, user: str, amount: float):
        return {
            "user": user,
            "from": "BHT",
            "to": "BTC",
            "simulated_btc": amount * 0.000001
        }
