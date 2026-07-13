#!/bin/sh
set -e
TARGET="/data"
SOURCE="/seed-html"
if [ ! -f "$TARGET/index.html" ]; then
  echo "Sin contenido: copiando contenido inicial"
  cp "$SOURCE"/index.html "$TARGET"/index.html
  echo " Copiado. Contenido de $TARGET:"
  ls -la "$TARGET"
else
  echo "El contenido ya existe: no se modifica (persistencia)"
fi
