/**
 * NeuroToken SDK JS Client — Public Safe Edition
 */
import { generateProof, verifyProof } from "../../zk_engine/engine.js";

export function createProgressProof(data) {
  return generateProof(data);
}

export function validateProgressProof(proof) {
  return verifyProof(proof);
}
