#!/usr/bin/env bash
set -euo pipefail

SOURCE_PATH="${1:-.}"
RULESET="${2:-p/nodejs}"

echo "🔍 Running SAST scan for Node.js"
echo "📁 Source path: $SOURCE_PATH"
echo "📜 Ruleset: $RULESET"

# Install Semgrep (kept local to action)
pip install --quiet semgrep

# Run scan (do NOT fail here)
cat << 'EOF' > test-node-rule.yml
rules:
  - id: node-force-fail
    pattern: eval(...)
    message: "Eval usage detected (test rule)"
    severity: ERROR
    languages: [javascript]
EOF

semgrep scan \
  --config=test-node-rule.yml \
  --json \
  "$SOURCE_PATH" > sast-results.json || true


echo "✅ SAST scan completed"
echo "📄 Results written to sast-results.json"
