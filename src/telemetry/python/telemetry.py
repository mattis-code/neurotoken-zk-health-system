"""
Local-only telemetry (public safe)
"""

import time

class Telemetry:
    def __init__(self):
        self.events = []

    def record(self, event: str, data=None):
        self.events.append({
            "event": event,
            "data": data or {},
            "ts": int(time.time()*1000)
        })

    def flush(self):
        batch = list(self.events)
        self.events.clear()
        return batch
