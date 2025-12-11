from sdk.python.client_stub import NeuroTokenClient
client=NeuroTokenClient()
print(client.submit_progress({'demo':1}))