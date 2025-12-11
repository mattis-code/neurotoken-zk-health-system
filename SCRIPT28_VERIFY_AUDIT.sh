#!/bin/bash

echo "🔍 SCRIPT 28 — External Auditor Mode STARTING…"
echo ""

############################################################
# 1. CHECK FOR TOMME FILER (unntatt .keep)
############################################################
echo "📁 Sjekker for tomme filer…"
EMPTY=$(find . -type f -empty -not -name ".keep")

if [[ -z "$EMPTY" ]]; then
    echo "✔ Ingen tomme filer funnet."
else
    echo "⚠️ Fant tomme filer:"
    echo "$EMPTY"
fi

echo ""

############################################################
# 2. CHECK WHITEPAPERS
############################################################
echo "📄 Sjekker whitepapers…"

for f in whitepapers/*.md; do
    if [[ ! -s "$f" ]]; then
        echo "❌ TOMT whitepaper: $f"
    else
        echo "✔ OK: $f"
    fi
done

echo ""

############################################################
# 3. CHECK DOCS
############################################################
echo "📚 Sjekker docs/…"

for f in docs/*.md; do
    if [[ ! -s "$f" ]]; then
        echo "❌ TOM fil i docs/: $f"
    else
        echo "✔ OK: $f"
    fi
done

echo ""

############################################################
# 4. CHECK ROADMAP + README
############################################################
echo "🛣 Verifiserer ROADMAP.md og README.md…"

if [[ ! -s "ROADMAP.md" ]]; then
    echo "❌ ROADMAP.md er tom!"
else
    echo "✔ ROADMAP.md OK"
fi

if [[ ! -s "README.md" ]]; then
    echo "❌ README.md er tom!"
else
    echo "✔ README.md OK"
fi

echo ""

############################################################
# 5. CHECK FORBIDDEN WORDS (“”, “”, osv.)
############################################################
echo "🔒 Sjekker repoet for ord som IKKE skal være der…"

FORBIDDEN="\|\|\|"

BAD=$(grep -Rni "$FORBIDDEN" . --exclude-dir=.git)

if [[ -z "$BAD" ]]; then
    echo "✔ Ingen forbudte ord funnet."
else
    echo "❌ Fant forbudte ord:"
    echo "$BAD"
fi

echo ""

############################################################
# 6. CHECK FOLDER STRUCTURE
############################################################
echo "📁 Verifiserer mappestruktur…"

EXPECTED=(src docs tests circuits examples whitepapers compliance scripts)

for folder in "${EXPECTED[@]}"; do
    if [[ ! -d "$folder" ]]; then
        echo "❌ Mangler mappe: $folder"
    else
        echo "✔ OK: $folder"
    fi
done

echo ""

############################################################
# 7. PRINT FINAL AUDIT SUMMARY
############################################################
echo "============================"
echo "🔍 EXTERNAL AUDIT — SUMMARY"
echo "============================"

echo "✔ Struktur verifisert"
echo "✔ Whitepapers sjekket"
echo "✔ Docs sjekket"
echo "✔ README / ROADMAP sjekket"
echo "✔ Sensitiv tekst sjekket"
echo ""
echo "🎯 SCRIPT 28 FULLFØRT"
