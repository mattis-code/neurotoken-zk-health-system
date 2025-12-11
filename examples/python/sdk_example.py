from src.sdk.python.client import NeuroTokenClient

sdk = NeuroTokenClient()

response = sdk.submit_progress({
    "user": "demo",
    "progress": 12,
})

print(response)
