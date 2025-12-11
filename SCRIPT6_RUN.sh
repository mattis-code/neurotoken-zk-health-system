#!/bin/bash
echo "🚀 SCRIPT 6 — Autogenerating API Docs + Search Engine + JSDoc + Sphinx"

############################################
# 1. PREPARE DIRECTORIES
############################################
mkdir -p docs/api/auto
mkdir -p docs/api/search
mkdir -p scripts

############################################
# 2. JSDOC SETUP FOR JS SDK
############################################
npm init -y >/dev/null 2>&1
npm install jsdoc --save-dev >/dev/null 2>&1

cat > jsdoc.json << 'EOT'
{
  "source": {
    "include": ["src", "sdk", "zk_engine"]
  },
  "opts": {
    "destination": "docs/api/auto/js",
    "recurse": true,
    "readme": "README.md"
  }
}
EOT

echo "✔ JSDoc config added"

############################################
# 3. PYTHON SPHINX SETUP
############################################
python3 -m pip install sphinx >/dev/null 2>&1

mkdir -p docs/api/auto/python

sphinx-quickstart docs/api/auto/python -q --project "NeuroToken ZK Health System" --author "Lionking Biotech" --sep

# Add autodoc extension
echo "extensions = ['sphinx.ext.autodoc']" >> docs/api/auto/python/source/conf.py

echo "✔ Sphinx initialized"


############################################
# 4. RUN GENERATORS
############################################
npx jsdoc -c jsdoc.json
echo "✔ JSDoc API built"

sphinx-apidoc -o docs/api/auto/python/source sdk/ || true
sphinx-build -b html docs/api/auto/python/source docs/api/auto/python/html
echo "✔ Sphinx Python API built"


############################################
# 5. BUILD SEARCH INDEX (lunr.js compatible)
############################################
cat > scripts/generate_search_index.js << 'EOT'
const fs = require('fs');
const path = require('path');

function walk(dir, list = []) {
  fs.readdirSync(dir).forEach(f => {
    const file = path.join(dir, f);
    if (fs.statSync(file).isDirectory()) walk(file, list);
    else if (file.endsWith('.md') || file.endsWith('.html')) {
      list.push({
        file: file.replace(/^docs\\//, ''),
        content: fs.readFileSync(file, 'utf8')
      });
    }
  });
  return list;
}

const index = walk('docs');
fs.writeFileSync('docs/api/search/index.json', JSON.stringify(index, null, 2));
console.log("✔ Search index created");
EOT

node scripts/generate_search_index.js


############################################
# 6. UPDATE DOCS INDEX PAGE
############################################
cat >> docs/index.md << 'EOT'

## 🔍 Search
A full-text search index is now available for all documentation.

Located at:
**/docs/api/search/index.json**

EOT

############################################
# 7. GIT COMMIT + PUSH
############################################
git add .
git commit -m "SCRIPT 6 — Auto API docs (JS + Python), search engine + indexing"
git push

echo "🎯 SCRIPT 6 COMPLETE — API AutoDocs + Search Engine Ready"
