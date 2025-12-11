import json

def serialize_canonical(obj):
    return json.dumps(obj, sort_keys=True)

def serialize_binary(text: str):
    return text.encode("utf-8")
