import { nt_hash } from "../../src/zk/hashing.js";

test("nt_hash should hash arrays", () => {
  const h = nt_hash([1,2,3]);
  expect(typeof h).toBe("string");
  expect(h.length).toBe(64);
});
