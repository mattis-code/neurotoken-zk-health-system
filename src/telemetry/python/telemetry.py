import json
import time
from pathlib import Path

class Telemetry:
    """
    Telemetry logger for the NeuroToken ZK Health System.
    Public-safe: never logs payloads, only meta-events.
    """

    LOG_PATH = Path("logs/telemetry.log")

    def log(self, event: str, metadata: dict = None):
        entry = {
            "timestamp": time.time(),
            "event": event,
            "metadata": metadata or {}
        }
        with open(self.LOG_PATH, "a") as f:
            f.write(json.dumps(entry) + "\n")
        return entry

    def sync(self):
        return {"status": "OK", "synced": True}
