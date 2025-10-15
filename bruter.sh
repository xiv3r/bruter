#!/bin/bash

# Check if any arguments are provided
if [ $# -ne 5 ]; then
    echo "Usage: $0 <ssh|telnet> <userdb> <passdb> <gateway_ip> <output_name>"
    echo "Example: $0 ssh users.txt passwords.txt 192.168.1.1 output.txt"
    exit 1
fi

# Assign input arguments to variables
protocol=$1
userdb=$2
passdb=$3
gateway_ip=$4
output_name=$5

# Validate protocol
if [ "$protocol" != "ssh" ] && [ "$protocol" != "telnet" ]; then
    echo "Error: Protocol must be 'ssh' or 'telnet'"
    exit 1
fi

# Check if userdb file exists
if [ ! -f "$userdb" ]; then
    echo "Error: User database file '$userdb' not found"
    exit 1
fi

# Check if passdb file exists
if [ ! -f "$passdb" ]; then
    echo "Error: Password database file '$passdb' not found"
    exit 1
fi

# Validate IP address format (basic check)
if ! [[ $gateway_ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    echo "Error: Invalid IP address format"
    exit 1
fi

# Set port and script based on protocol
if [ "$protocol" = "ssh" ]; then
    port=22
    script="ssh-brute"
elif [ "$protocol" = "telnet" ]; then
    port=23
    script="telnet-brute"
fi

# Run Nmap command
echo "Running Nmap $protocol brute-force scan on $gateway_ip..."
nmap -p $port --script $script --script-args userdb="$userdb",passdb="$passdb" "$gateway_ip" -oN "$output_name"

# Check if Nmap command was successful
if [ $? -eq 0 ]; then
    echo "Scan completed. Results saved to $output_name"
else
    echo "Error: Nmap scan failed"
    exit 1
fi
