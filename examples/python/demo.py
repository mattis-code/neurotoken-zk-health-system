from src.sdk.python.client import NeuroTokenClient
client = NeuroTokenClient("http://localhost")
print(client.submit_progress({"score": 10}))
