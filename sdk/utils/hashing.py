import hashlib
def hash_progress_data(d): return hashlib.sha256(d.encode()).hexdigest()