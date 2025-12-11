import fs from "fs";

export class Telemetry {
  constructor() {
    this.logFile = "logs/telemetry.log";
  }

  log(event, metadata = {}) {
    const entry = {
      timestamp: Date.now(),
      event,
      metadata,
    };
    fs.appendFileSync(this.logFile, JSON.stringify(entry) + "\n");
    return entry;
  }

  sync() {
    return { status: "OK", synced: true };
  }
}
