import { NeuroTokenClient } from "../../src/sdk/js/client.js";

const sdk = new NeuroTokenClient();

const result = await sdk.submitProgress({
  user: "demo",
  progress: 12,
});

console.log(result);
