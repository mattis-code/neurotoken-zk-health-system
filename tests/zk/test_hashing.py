from src.zk.hashing import nt_hash

def test_nt_hash():
    h = nt_hash([1,2,3])
    assert isinstance(h, str)
    assert len(h) == 64
