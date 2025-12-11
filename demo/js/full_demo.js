import { serializePayload } from "../../src/zk/serialization.js";
import { hashPayload } from "../../src/zk/hashing.js";
import { Orchestrator } from "../../src/orchestrator/orchestrator.js";
import { SyncEngine } from "../../src/sync/sync_engine.js";
import { Aggregator } from "../../src/aggregation/aggregation.js";

async function runDemo() {
  const input = { user: "demo", progress: 42 };

  const serialized = serializePayload(input);
  const hash = hashPayload(serialized);

  const orch = new Orchestrator();
  const sync = new SyncEngine();
  const agg = new Aggregator();

  const step1 = orch.process(serialized);
  const step2 = sync.sync(step1);
  const final = agg.aggregate([step1, step2], hash);

  console.log("FINAL OUTPUT:", final);
}

runDemo();
