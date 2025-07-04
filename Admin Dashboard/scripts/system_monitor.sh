#!/bin/bash

log_file="../logs/monitor_$(date +%Y%m%d).log"

# Ensure logs directory exists
if [ ! -d "../logs" ]; then
  mkdir -p "../logs"
fi

echo "----- System Monitor & Reporter -----"

# Collect system data
echo "Date: $(date)" >> "$log_file"
echo "Hostname: $(hostname)" >> "$log_file"
echo -e "\n--- CPU Usage (top 5 processes) ---" >> "$log_file"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6 >> "$log_file"

echo -e "\n--- Memory Usage ---" >> "$log_file"
free -h >> "$log_file"

echo -e "\n--- Disk Usage ---" >> "$log_file"
df -h >> "$log_file"

echo -e "\n--- Uptime ---" >> "$log_file"
uptime >> "$log_file"

echo -e "\n--- System Monitor Log Complete ---" >> "$log_file"

# Show summary to user
echo "System monitoring data saved to: $log_file"
