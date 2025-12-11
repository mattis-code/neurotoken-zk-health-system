/**
 * Local-only telemetry module (public safe)
 */
export class Telemetry {
  constructor() {
    this.events = [];
  }

  record(event, data = {}) {
    this.events.push({
      event,
      data,
      ts: Date.now()
    });
  }

  flush() {
    const batch = [...this.events];
    this.events = [];
    return batch;
  }
}
