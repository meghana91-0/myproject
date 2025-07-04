#!/bin/bash

log_file="../logs/monitor_gitbash_$(date +%Y%m%d).log"

# Ensure logs directory exists
if [ ! -d "../logs" ]; then
  mkdir -p "../logs"
fi

echo "----- Basic System Monitor (Git Bash Compatible) -----"

# Log the date and hostname
echo "Date: $(date)" >> "$log_file"
echo "Hostname: $(hostname)" >> "$log_file"

# Use basic ps and df
echo -e "\n--- Top 5 CPU-consuming Processes (basic ps) ---" >> "$log_file"
ps | head -n 6 >> "$log_file"

echo -e "\n--- Disk Usage ---" >> "$log_file"
df -h >> "$log_file"

echo -e "\n--- Script Complete ---" >> "$log_file"

# Show the path of the log
echo "Log saved to: $log_file"
