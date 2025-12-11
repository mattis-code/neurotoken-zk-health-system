from src.zk.serialization import serialize_payload
from src.zk.hashing import hash_payload
from src.orchestrator.orchestrator import Orchestrator
from src.sync.sync_engine import SyncEngine
from src.aggregation.aggregation import Aggregator

def run_demo():
    input_data = {"user": "demo", "progress": 42}

    serialized = serialize_payload(input_data)
    hashed = hash_payload(serialized)

    orch = Orchestrator()
    sync = SyncEngine()
    agg = Aggregator()

    step1 = orch.process(serialized)
    step2 = sync.sync(step1)
    final = agg.aggregate([step1, step2], hashed)

    print("FINAL OUTPUT:", final)

if __name__ == "__main__":
    run_demo()
