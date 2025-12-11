#!/bin/bash
echo "Building JS bundle..."
mkdir -p dist
npx esbuild src/index.js --bundle --outfile=dist/neurotoken.js
