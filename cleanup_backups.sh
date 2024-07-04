#!/bin/bash
BACKUP_DIR="/home/backups"
FILES_TO_KEEP=7
find "$BACKUP_DIR" -type f -printf '%T@ %p\n' | sort -n | head -n -$FILES_TO_KEEP | cut -d' ' -f2- | xargs -r rm
