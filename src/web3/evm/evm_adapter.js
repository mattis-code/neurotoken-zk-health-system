// EVM Adapter (JS)
// Public-safe

class EVMAdapter {
    constructor() {
        this.network = "polygon";
    }

    createWallet() {
        return {
            address: "evm-" + Math.random().toString(36).substring(2),
            publicKey: "pubkey",
        };
    }

    sendTransaction(from, to, amount) {
        return {
            hash: "evm-tx-" + Date.now(),
            from,
            to,
            amount
        };
    }
}

module.exports = { EVMAdapter };
