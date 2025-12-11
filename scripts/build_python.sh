#!/bin/bash
echo "Building python wheel..."
python3 -m pip install --upgrade build
python3 -m build
