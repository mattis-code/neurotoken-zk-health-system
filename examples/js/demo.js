import { createProgressProof, validateProgressProof } from "../../sdk/js/client.js";

const demo = createProgressProof({ session: 1 });
console.log("Generated proof:", demo);

console.log("Valid:", validateProgressProof(demo));
