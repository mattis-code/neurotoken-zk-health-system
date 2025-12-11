/**
 * NeuroToken Token Economy — JS Mock
 * (safe — no secret data)
 */

export function computeBHBRMock(balanceBTC) {
  return balanceBTC * 1000; // example multiplier
}

export function computeBHTIssuanceMock(progressDelta) {
  return progressDelta * 10; // example issuance
}
