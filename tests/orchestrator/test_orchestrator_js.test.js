import { orchestrateProof } from "../../src/orchestrator/orchestrator.js";

test("orchestrator JS produces a proofHash", () => {
  const out = orchestrateProof({ a: 1 });
  expect(typeof out.proofHash).toBe("string");
  expect(out.metadata.serializedLength).toBeGreaterThan(0);
});
