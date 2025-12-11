from sdk.python.client import create_progress_proof, validate_progress_proof

demo = create_progress_proof({"session": 1})
print("Generated:", demo)
print("Valid:", validate_progress_proof(demo))
