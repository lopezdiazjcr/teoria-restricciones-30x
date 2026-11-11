#!/bin/sh
# Falla si la landing o el PDF nombran a Hormozi o a Acquisition.com, y si los botones no apuntan donde deben.
cd "$(dirname "$0")/.." || exit 1
fallo=0
if grep -i -E "hormozi|acquisition" index.html >/dev/null; then echo "FALLA: index.html menciona a Hormozi o Acquisition"; fallo=1; fi
if pdftotext guia-teoria-restricciones-30x.pdf - 2>/dev/null | grep -i -E "hormozi|acquisition" >/dev/null; then echo "FALLA: el PDF menciona a Hormozi o Acquisition"; fallo=1; fi
grep -q 'href="guia-teoria-restricciones-30x.pdf" download' index.html || { echo "FALLA: falta el botón de descarga"; fallo=1; }
grep -q 'thirtyfold-constraint-finder.lovable.app' index.html || { echo "FALLA: falta el botón al diagnóstico"; fallo=1; }
[ $fallo -eq 0 ] && echo "OK"
exit $fallo
