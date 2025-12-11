import fs from "fs";
import crypto from "crypto";

const requiredDirs = [
  "src",
  "src/bhbr",
  "src/bht",
  "src/zk_stub",
  "src/validator",
  "src/coupling",
  "docs"
];

function hashFile(path) {
  return crypto
    .createHash("sha256")
    .update(fs.readFileSync(path))
    .digest("hex");
}

export class IntegrityScanner {
  run() {
    const results = {
      timestamp: Date.now(),
      missing_dirs: [],
      file_hashes: {}
    };

    for (const d of requiredDirs) {
      if (!fs.existsSync(d)) results.missing_dirs.push(d);
    }

    function traverse(dir) {
      const files = fs.readdirSync(dir);
      for (const file of files) {
        const full = `${dir}/${file}`;
        const stat = fs.statSync(full);
        if (stat.isDirectory()) traverse(full);
        else if (full.endsWith(".js") || full.endsWith(".py")) {
          results.file_hashes[full] = hashFile(full);
        }
      }
    }

    traverse("src");

    const payload =
      results.missing_dirs.join("") +
      Object.values(results.file_hashes).join("") +
      results.timestamp.toString();

    results.unified_snapshot = crypto
      .createHash("sha256")
      .update(payload)
      .digest("hex");

    return results;
  }
}
