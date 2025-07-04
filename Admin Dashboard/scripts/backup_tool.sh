#!/bin/bash

log_file="../logs/backup_$(date +%Y%m%d).log"
backup_dir="../backups"

# Ensure backup and log directories exist
mkdir -p "$backup_dir"
mkdir -p "../logs"

echo "----- Backup Tool -----"
read -p "Enter the absolute or relative path of the folder to back up: " source

# Ensure the source exists
if [ ! -d "$source" ]; then
  echo "❌ Directory '$source' does not exist."
  echo "$(date): ❌ Backup failed. '$source' does not exist." >> "$log_file"
  exit 1
fi

# Name the backup file
folder_name=$(basename "$source")
timestamp=$(date +%Y%m%d_%H%M%S)
backup_file="$backup_dir/${folder_name}_backup_$timestamp.tar.gz"

# Create the backup
tar -czf "$backup_file" "$source" 2>>"$log_file"

if [ $? -eq 0 ]; then
  echo "✅ Backup created: $backup_file"
  echo "$(date): ✅ Backup successful for $source to $backup_file" >> "$log_file"
else
  echo "❌ Backup failed."
  echo "$(date): ❌ Error creating backup for $source" >> "$log_file"
fi
