#!/usr/bin/env bash

# Modo estricto: detiene la ejecución si ocurre un error o una variable no existe
set -euo pipefail

# Configuración de rutas (ajusta según tus necesidades)
ORIGEN="${HOME}/Documentos"
DESTINO="${HOME}/Respaldos"
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVO_BACKUP="backup_${FECHA}.tar.gz"
DIAS_RETENCION=7

# 1. Validar que la carpeta de origen exista
if [ ! -d "$ORIGEN" ]; then
  echo "[ERROR] El directorio origen '$ORIGEN' no existe." >&2
  exit 1
fi

# 2. Crear la carpeta de destino si no existe
mkdir -p "$DESTINO"

echo "==> Iniciando respaldo de '$ORIGEN'..."

# 3. Empaquetar y comprimir con tar
# -c: crear, -z: gzip, -f: nombre archivo, -C: cambia al directorio antes de empaquetar
tar -czf "${DESTINO}/${ARCHIVO_BACKUP}" -C "$(dirname "$ORIGEN")" "$(basename "$ORIGEN")"

echo "[OK] Respaldo completado con éxito:"
ls -lh "${DESTINO}/${ARCHIVO_BACKUP}"

# 4. Limpieza de respaldos antiguos (más de 7 días)
echo "==> Limpiando respaldos con más de ${DIAS_RETENCION} días..."
find "$DESTINO" -name "backup_*.tar.gz" -type f -mtime +"$DIAS_RETENCION" -exec rm -v {} \;

echo "==> Proceso finalizado correctamente."
