from src.sdk.python.client import NeuroTokenClient

def test_python_signing():
    sdk = NeuroTokenClient()
    sig = sdk.sign_payload({"a": 1, "b": 2})
    assert isinstance(sig, str)
    assert len(sig) == 64
