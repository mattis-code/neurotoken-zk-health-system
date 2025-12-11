from src.network.python.network import NetworkClient

def test_network_request_ok():
    n = NetworkClient()
    res = n.request("/demo", {"x": 1})
    assert res["ok"] is True
    assert "hash" in res
