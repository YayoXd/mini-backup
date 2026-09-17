# Mini-Backup CLI

Script ligero en Bash para automatizar copias de seguridad de directorios locales con compresión `gzip` y política de rotación automática.

## Características
- Empaqueta y comprime directorios usando `tar` y `gzip`.
- Estampado de tiempo automático (`YYYY-MM-DD_HH-MM-SS`) para evitar sobreescrituras.
- Limpieza automática de respaldos obsoletos (más de 7 días) con `find`.
- Salidas con códigos de error estándar y modo estricto (`set -euo pipefail`).

## Requisitos
- GNU/Linux
- `tar` y `gzip` (instalados por defecto en casi cualquier distribución)

## Uso
1. Clona el repositorio:
   ```bash
   git clone [https://github.com/tu-usuario/mini-backup.git](https://github.com/tu-usuario/mini-backup.git)
   cd mini-backup
