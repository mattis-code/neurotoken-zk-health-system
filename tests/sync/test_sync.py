from src.sync.sync_engine import compare_outputs

def test_compare_outputs():
    a = {"x": 1, "y": 2}
    b = {"y": 2, "x": 1}
    assert compare_outputs(a, b) is True
