from sdk.python.client import create_progress_proof, validate_progress_proof

print("Running python unit tests...")

p = create_progress_proof({"x": 1})

assert validate_progress_proof(p)

print("✔ Python engine tests passed")
