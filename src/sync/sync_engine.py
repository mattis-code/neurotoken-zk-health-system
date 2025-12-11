"""
Sync Engine — Python Edition
"""
import json

def normalize_json(obj):
    return json.dumps(obj, sort_keys=True)

def compare_outputs(js_output, py_output):
    return normalize_json(js_output) == normalize_json(py_output)
