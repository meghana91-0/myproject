#!/bin/bash

log_file="../logs/file_ops.log"

# Ensure logs directory exists
if [ ! -d "../logs" ]; then
  mkdir -p "../logs"
fi

echo "----- File & Directory Manager -----"
echo "1. Create File"
echo "2. Create Directory"
echo "3. Rename File/Directory"
echo "4. Delete File/Directory"
echo "5. Cleanup files older than 7 days"
read -p "Choose an option [1-5]: " choice

case $choice in
  1)
    read -p "Enter filename: " fname
    touch "$fname"
    echo "$(date): Created file $fname" >> "$log_file"
    ;;
  2)
    read -p "Enter directory name: " dname
    mkdir "$dname"
    echo "$(date): Created directory $dname" >> "$log_file"
    ;;
  3)
    read -p "Enter current name: " old
    read -p "Enter new name: " new
    mv "$old" "$new"
    echo "$(date): Renamed $old to $new" >> "$log_file"
    ;;
  4)
    read -p "Enter file/directory to delete: " del
    rm -r "$del"
    echo "$(date): Deleted $del" >> "$log_file"
    ;;
  5)
    read -p "Enter path to cleanup (files older than 7 days): " path
    find "$path" -type f -mtime +7 -delete
    echo "$(date): Cleaned up files older than 7 days in $path" >> "$log_file"
    ;;
  *)
    echo "Invalid option"
    ;;
esac
