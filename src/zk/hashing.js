/**
 * NeuroToken ZK System — Hashing Module
 * Provides a  Poseidon-like hash using SHA-256
 * (safe for open-source, no sensitive ZK construction)
 */
import crypto from "crypto";

export function nt_hash(inputs) {
  if (!Array.isArray(inputs)) throw new Error("inputs must be array");
  const data = inputs.map(x => x.toString()).join("|");
  return crypto.createHash("sha256").update(data).digest("hex");
}
