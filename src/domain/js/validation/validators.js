/**
 * Validation Layer — JS Edition
 */

export function validateProgressEvent(evt) {
  if (!evt.userId) throw new Error("userId missing");
  if (typeof evt.delta !== "number") throw new Error("delta must be number");
  return true;
}

export function validateHealthScore(score) {
  if (typeof score.value !== "number") throw new Error("value must be number");
  return true;
}
