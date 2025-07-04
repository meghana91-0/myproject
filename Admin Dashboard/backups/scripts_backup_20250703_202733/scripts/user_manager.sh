#!/bin/bash

log_file="../logs/user_audit.log"

# Ensure logs directory exists
if [ ! -d "../logs" ]; then
  mkdir -p "../logs"
fi

echo "----- User & Permission Manager -----"
echo "1. Create User"
echo "2. Create Group"
echo "3. Add User to Group"
echo "4. Set Directory Permissions"
echo "5. Generate Home Directory Permission Report"
read -p "Choose an option [1-5]: " choice

case $choice in
  1)
    read -p "Enter new username: " username
    sudo useradd "$username"
    echo "User $username created."
    echo "$(date): Created user $username" >> "$log_file"
    ;;
  2)
    read -p "Enter new group name: " group
    sudo groupadd "$group"
    echo "Group $group created."
    echo "$(date): Created group $group" >> "$log_file"
    ;;
  3)
    read -p "Enter username: " username
    read -p "Enter group name: " group
    sudo usermod -aG "$group" "$username"
    echo "Added $username to $group."
    echo "$(date): Added $username to group $group" >> "$log_file"
    ;;
  4)
    read -p "Enter directory path: " dir
    read -p "Enter permission code (e.g., 755): " perm
    read -p "Enter owner (username:group): " owner
    sudo chmod "$perm" "$dir"
    sudo chown "$owner" "$dir"
    echo "Set permissions $perm and owner $owner on $dir."
    echo "$(date): Set permissions and ownership for $dir" >> "$log_file"
    ;;
  5)
    echo "Permission report for /home:" > "$log_file"
    ls -l /home >> "$log_file"
    cat "$log_file"
    ;;
  *)
    echo "Invalid option"
    ;;
esac
