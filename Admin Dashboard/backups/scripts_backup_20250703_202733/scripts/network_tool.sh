#!/bin/bash

log_file="../logs/network_$(date +%Y%m%d).log"

# Ensure logs directory exists
if [ ! -d "../logs" ]; then
  mkdir -p "../logs"
fi

echo "----- Network Diagnostic Tool -----"
echo "1. Ping a website"
echo "2. DNS lookup"
echo "3. Traceroute"
echo "4. HTTP response check (curl)"
read -p "Choose an option [1-4]: " choice

case $choice in
  1)
    read -p "Enter domain or IP to ping: " host
    echo -e "\n--- Ping Results for $host ---" >> "$log_file"
    ping -c 4 "$host" >> "$log_file" 2>&1
    echo "Ping completed. See log: $log_file"
    ;;
  2)
    read -p "Enter domain to resolve: " domain
    echo -e "\n--- DNS Lookup for $domain ---" >> "$log_file"
    nslookup "$domain" >> "$log_file" 2>&1
    echo "DNS lookup completed. See log: $log_file"
    ;;
  3)
    read -p "Enter host for traceroute: " target
    echo -e "\n--- Traceroute to $target ---" >> "$log_file"
    traceroute "$target" >> "$log_file" 2>&1
    echo "Traceroute completed. See log: $log_file"
    ;;
  4)
    read -p "Enter URL to test (e.g., https://example.com): " url
    echo -e "\n--- HTTP Response for $url ---" >> "$log_file"
    curl -I "$url" >> "$log_file" 2>&1
    echo "HTTP check completed. See log: $log_file"
    ;;
  *)
    echo "Invalid option"
    ;;
esac
