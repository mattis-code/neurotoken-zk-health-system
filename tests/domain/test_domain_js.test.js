import { ProgressEvent } from "../../src/domain/js/entities.js";
import { validateProgressEvent } from "../../src/domain/js/validation/validators.js";

test("ProgressEvent validates", () => {
  const evt = new ProgressEvent({ userId:"u123", delta:4, timestamp:123 });
  expect(() => validateProgressEvent(evt)).not.toThrow();
});
