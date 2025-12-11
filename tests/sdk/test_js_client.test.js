import { NeuroTokenClient } from "../../src/sdk/js/client.js";

test("JS SDK: signing works", () => {
  const sdk = new NeuroTokenClient();
  const sig = sdk.signPayload({ a: 1, b: 2 });
  expect(typeof sig).toBe("string");
  expect(sig.length).toBe(64);
});
