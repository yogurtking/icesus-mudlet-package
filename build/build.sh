#!/usr/bin/env bash
# Build the Mudlet package zip. Output: dist/Icesus.mpackage
#
# A .mpackage is just a zip of the package contents. Mudlet expects:
#   - config.lua at the root
#   - one .xml file (any name) defining the triggers/scripts/etc.
#
# Usage: ./build/build.sh
set -euo pipefail

cd "$(dirname "$0")/.."

OUT_DIR=dist
OUT="$OUT_DIR/Icesus.mpackage"

mkdir -p "$OUT_DIR"
rm -f "$OUT"

python3 - "$OUT" <<'PY'
import os, sys, zipfile
out = sys.argv[1]
src = "package"
with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as z:
    for root, dirs, files in os.walk(src):
        dirs[:] = [d for d in dirs if not d.startswith(".")]
        for f in files:
            if f.startswith(".") or f.endswith(".swp"):
                continue
            full = os.path.join(root, f)
            arc  = os.path.relpath(full, src)
            z.write(full, arc)
PY

echo "Built $OUT"
ls -lh "$OUT"
unzip -l "$OUT"
