#!/usr/bin/env bash

set -o allexport
source .env
set +o allexport

BASE_URL="https://www.heroctf.fr"
BACKUP_DIR="$HOME/backup"

mkdir -p $BACKUP_DIR
curl "${BASE_URL}/admin/export" -b "session=${CTFD_COOKIE_SESSION}" -o "${BACKUP_DIR}/backup_$(date +%d-%m-%Y-%H:%M).zip"

# Crontab every 4 hours
# 0 */4 * * * /usr/bin/bash /home/debian/ctfd_backup.sh