#!/bin/bash
set -e

: "${DB_HOST:?DB_HOST не задано}"
: "${DB_PORT:?DB_PORT не задано}"
: "${DB_USER:?DB_USER не задано}"
: "${DB_PASSWORD:?DB_PASSWORD не задано}"
: "${DB_NAME:?DB_NAME не задано}"
: "${BACKUP_RETENTION_COUNT:?BACKUP_RETENTION_COUNT не задано}"

TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="/backups/backup_${TIMESTAMP}.sql"

export PGPASSWORD="$DB_PASSWORD"
pg_dump -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$DB_NAME" > "$BACKUP_FILE"

ls -1t /backups/backup_*.sql | tail -n +$((BACKUP_RETENTION_COUNT + 1)) | xargs --no-run-if-empty rm -f

