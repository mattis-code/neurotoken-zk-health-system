export class NeuroTokenClient {
  constructor(config) {
    this.endpoint = config.endpoint
  }
  async submitProgress(data) {
    return { status: "ok", proof: "ZK_PROOF_PLACEHOLDER" }
  }
}
