/**
 * Sync Engine — JS Edition
 */

export function normalizeJSON(obj) {
  return JSON.stringify(obj, Object.keys(obj).sort());
}

export function compareOutputs(jsOutput, pyOutput) {
  return normalizeJSON(jsOutput) === normalizeJSON(pyOutput);
}
