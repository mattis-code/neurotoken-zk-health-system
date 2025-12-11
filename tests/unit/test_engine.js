import { generateProof, verifyProof } from "../../zk_engine/engine.js";

console.log("Running unit tests for ZK Engine...");
const p = generateProof({ x: 1 });

if (!verifyProof(p)) {
  throw new Error("Proof verification failed");
}

console.log("✔ ZK Engine unit tests passed");
