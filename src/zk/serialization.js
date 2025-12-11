export function serializeCanonical(obj) {
  return JSON.stringify(obj, Object.keys(obj).sort());
}

export function serializeBinary(str) {
  return Buffer.from(str, "utf8");
}
