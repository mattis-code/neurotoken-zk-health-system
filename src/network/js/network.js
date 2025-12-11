/**
 * NeuroToken™ Network Layer (JavaScript)
 * Public-safe request wrapper with telemetry + unified errors.
 */

import crypto from "crypto";

export class NTError extends Error {
  constructor(code, message, details = {}) {
    super(message);
    this.code = code;
    this.details = details;
  }
}

export class NetworkClient {
  constructor(config = {}) {
    this.timeout = config.timeout || 3000;
  }

  async request(path, payload) {
    const start = Date.now();

    try {
      await new Promise(res => setTimeout(res, 50)); // Mock latency

      const hash = crypto
        .createHash("sha256")
        .update(JSON.stringify(payload))
        .digest("hex");

      return {
        ok: true,
        latency: Date.now() - start,
        echo: payload,
        hash
      };
    } catch (err) {
      throw new NTError("NETWORK_ERROR", "Failed network operation", {
        original: err.message
      });
    }
  }
}
