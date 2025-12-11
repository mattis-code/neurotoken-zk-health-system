import { NetworkClient } from "../../src/network/js/network.js";

test("JS network request OK", async () => {
  const n = new NetworkClient();
  const res = await n.request("/demo", { x: 1 });
  expect(res.ok).toBe(true);
  expect(typeof res.hash).toBe("string");
});
