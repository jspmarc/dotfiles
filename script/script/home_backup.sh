#!/bin/env sh

BASE_BACKUP_DIR=/mnt/data/home-backup
BACKUP_ARCHIVE_NAME="$(date +'%y-%m-%d').tar.gz"
BASE_LOG_DIR=${BASE_BACKUP_DIR}/log
HOME="${HOME:1}"

notify-send "Creating a home backup..."

tar -cvz -C / -f "${BASE_BACKUP_DIR}/${BACKUP_ARCHIVE_NAME}" \
    "${HOME}/Downloads" \
    "${HOME}/Videos" \
    "${HOME}/projects" \
    "${HOME}/Pictures" \
    "${HOME}/Documents" | tee "${BASE_LOG_DIR}/current_process.log"

notify-send "Backup ${BACKUP_ARCHIVE_NAME} created."
echo "Backup ${BACKUP_ARCHIVE_NAME} CREATED on $(date)" >> "${BASE_LOG_DIR}/backup.log"

# Deletes the oldest backup if more than 3 backup exists
filecount=$(find "$BASE_BACKUP_DIR" -name '*.tar.gz' | wc -l)
if [[ ${filecount} -gt 3 ]]; then
    tbd=$(ls ${BASE_BACKUP_DIR} -h | head -n1)
    rm "$BASE_BACKUP_DIR/$tbd"
    echo "Backup $tbd DELETED on $(date)" >> "${BASE_LOG_DIR}/backup.log"
fi
