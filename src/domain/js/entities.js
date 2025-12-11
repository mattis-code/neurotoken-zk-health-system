/**
 * Domain Entities — JS Edition
 */

export class ProgressEvent {
  constructor({ userId, delta, timestamp }) {
    this.userId = userId;
    this.delta = delta;
    this.timestamp = timestamp;
  }
}

export class HealthScore {
  constructor({ value }) {
    this.value = value;
  }
}

export class RehabMilestone {
  constructor({ step, completed }) {
    this.step = step;
    this.completed = completed;
  }
}

export class UserProfile {
  constructor({ userId, region }) {
    this.userId = userId;
    this.region = region;
  }
}

export class ZKProofEnvelope {
  constructor({ proofHash, metadata }) {
    this.proofHash = proofHash;
    this.metadata = metadata;
  }
}
