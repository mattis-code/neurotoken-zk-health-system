import crypto from "crypto";

export class BHTEngine {
  constructor() {
    this.totalSupply = 0.0;
    this.lastUpdate = Date.now();
  }

  mint(amount, reason = "unspecified") {
    amount = parseFloat(amount);
    this.totalSupply += amount;
    this.lastUpdate = Date.now();

    return {
      status: "ok",
      operation: "mint",
      amount,
      reason,
      new_total_supply: this.totalSupply,
      integrity_hash: this.integrityHash()
    };
  }

  burn(amount, reason = "unspecified") {
    amount = parseFloat(amount);

    if (amount > this.totalSupply) {
      return { status: "error", reason: "insufficient_supply" };
    }

    this.totalSupply -= amount;
    this.lastUpdate = Date.now();

    return {
      status: "ok",
      operation: "burn",
      amount,
      reason,
      new_total_supply: this.totalSupply,
      integrity_hash: this.integrityHash()
    };
  }

  integrityHash() {
    const payload = `${this.totalSupply}-${this.lastUpdate}`;
    return crypto.createHash("sha256").update(payload).digest("hex");
  }

  snapshot() {
    return {
      total_supply: this.totalSupply,
      last_update: this.lastUpdate,
      integrity_hash: this.integrityHash()
    };
  }
}
