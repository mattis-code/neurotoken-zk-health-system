/**
 * Loads a  circuit definition.
 * No sensitive structure exposed.
 */
export function loadCircuit(name) {
  return {
    circuit: name,
    version: "0.1-public",
    gates: 0,
    wires: 0,
    description: "Public-safe  circuit"
  };
}
