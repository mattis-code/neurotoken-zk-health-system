import crypto from "crypto";

export class BHBRReserve {
  constructor(initialBTC = 0.0) {
    this.btc = parseFloat(initialBTC);
    this.lastUpdate = Date.now();
  }

  deposit(amount) {
    this.btc += parseFloat(amount);
    this.lastUpdate = Date.now();
    return { status: "ok", new_balance: this.btc };
  }

  withdraw(amount) {
    amount = parseFloat(amount);

    if (amount > this.btc) {
      return { status: "error", reason: "insufficient_reserve" };
    }

    this.btc -= amount;
    this.lastUpdate = Date.now();
    return { status: "ok", new_balance: this.btc };
  }

  integrityHash() {
    const payload = `${this.btc}-${this.lastUpdate}`;
    return crypto.createHash("sha256").update(payload).digest("hex");
  }

  snapshot() {
    return {
      btc_balance: this.btc,
      last_update: this.lastUpdate,
      integrity_hash: this.integrityHash()
    };
  }
}
