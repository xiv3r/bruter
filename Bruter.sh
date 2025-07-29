#!/bin/bash

# Simple Nmap port scanner with SSH/Telnet detection

GW=$(ip route | awk '/default/ && /wlan[0-9]/ {print $3}')

# Check if nmap is installed
if ! command -v nmap &> /dev/null; then
    echo "Nmap is not installed. Please install it first."
    exit 1
fi

# Get target IP or hostname
echo "Enter Router Gateway IP: Enter to use by default"
read -r -p "> $GW " INET
target="${INET:-$GW}"

# Initial scan to detect open ports
echo "Scanning $target for open ports..."
ports=$(nmap -Pn -T4 --open $target | awk -F'/' '/^[0-9]/{print $1}' | tr '\n' ',' | sed 's/,$//')

if [ -z "$ports" ]; then
    echo "No open ports found on $target"
    exit 0
fi

echo "Open ports detected: $ports"

# Check for SSH (22) or Telnet (23)
if [[ $ports == *"22"* ]] || [[ $ports == *"23"* ]]; then
    echo "SSH (22) or Telnet (23) detected!"

    # Prompt user for action
    read -p "Do you want to run bruteforce test? (y/n): " choice

    if [[ $choice =~ [yY] ]]; then

        # Defaults
        prt=22
        scrpt=ssh-brute
        udb=users.txt
        pdb=passwords.txt
        output=logs.txt

        # Get script parameters
        echo "Enter port to test e.g 22 or 23: Enter to use by default"
        read -r -p "> $prt " PRT
        port="${PRT:-$prt}"


        echo "Enter script name e.g. ssh-brute, telnet-brute: Enter to use by default"
        read -r -p "> $scrpt " SCRPT
        script="${SCRPT:-$scrpt}"


        echo "Enter path to userdb file e.g user.txt: Enter Router Gateway IP: Enter to use by default"
        read -r -p "> $udb " UDB
        userdb="${UDB:-$udb}"


        echo "Enter path to passdb file: e.g pass.txt: Enter Router Gateway IP: Enter to use by default"
        read -r -p "> $pdb " PDB
        passdb="${PDB:-$pdb}"


        echo "Enter output filename e.g log.txt: Enter Router Gateway IP: Enter to use by default"
        read -r -p "> $output " OUTPUT
        output_name="${OUTPUT:-$output}"


        # Run the detailed scan
        echo "Running bruteforce test against port $port..."
        nmap -p $port --script $script --script-args userdb="$userdb",passdb="$passdb" "$target" -oN "$output_name" -vv

        echo "Scan completed. Results saved to $output_name"
    else
        echo "Skipping bruteforce test."
    fi
else
    echo "No SSH or Telnet ports found. Exiting."
fi
