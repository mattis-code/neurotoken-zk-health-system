import { NeuroTokenClient } from "../../sdk/js/client.js";

/**
 * Orchestrator for NeuroToken ZK Health System.
 * Handles:
 * - hashing
 * - serialization
 * - domain validation
 * - placeholder ZK integration
 */
export class Orchestrator {
  constructor() {
    this.client = new NeuroTokenClient();
  }

  process(payload) {
    if (!this.client.validateDomain(payload)) {
      throw new Error("Invalid domain payload");
    }

    const serialized = this.client.serialize(payload);
    const hashed = this.client.hash(serialized);

    return {
      serialized,
      hashed,
      status: "OK",
      zk_proof_placeholder: true,
    };
  }
}
