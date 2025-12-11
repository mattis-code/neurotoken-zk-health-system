// Bridge Router (JS)
// Connects: Bitcoin → BHT → BHBR (simulated, public-safe)

class BridgeRouter {
    constructor(bhbr, bht) {
        this.bhbr = bhbr;
        this.bht = bht;
    }

    proofMint(user, proofScore) {
        const reward = Math.round(proofScore * 10);
        this.bht.mint(user, reward);
        return reward;
    }

    convertBHTtoBTC(user, amount) {
        return {
            user,
            from: "BHT",
            to: "BTC",
            simulated_btc: amount * 0.000001
        };
    }
}

module.exports = { BridgeRouter };
