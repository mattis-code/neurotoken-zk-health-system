import crypto from "crypto";

export class EconomicStateHashEngine {
  constructor(bhbr, bht, zk, validator) {
    this.bhbr = bhbr;
    this.bht = bht;
    this.zk = zk;
    this.validator = validator;
  }

  compute() {
    const tri = this.validator.evaluate(this.zk);

    const payload = {
      btc_reserve: this.bhbr.btc,
      bht_supply: this.bht.totalSupply,
      zk_score: tri.zk_score,
      validator_hash: tri.unified_state_hash,
      timestamp: Date.now()
    };

    const unified = crypto
      .createHash("sha256")
      .update(JSON.stringify(payload))
      .digest("hex");

    return {
      payload,
      state_hash: unified
    };
  }
}
