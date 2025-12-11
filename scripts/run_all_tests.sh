#!/bin/bash
echo "Running JS tests..."
node tests/unit/test_engine.js

echo "Running Python tests..."
python3 tests/unit/test_engine.py
