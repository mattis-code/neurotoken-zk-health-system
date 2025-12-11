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
