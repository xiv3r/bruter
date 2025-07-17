# Platforms
- Windows
- Linux
- Termux

# Installation
```
sudo apt update && sudo apt install nmap wget -y && wget -qO | sudo bash && cd bruter
```

# Usage
- SSH
```
./brute.sh ssh users.txt passwords.txt 192.168.1.1 output.txt
```
- TELNET
```
./brute.sh telnet users.txt passwords.txt 192.168.1.1 output.txt
```

# Hint
1. `ssh/telnet` - target port
2. `users.txt` - ssh or telnet admin account
3. `passwords.txt` - your password wordlist you can download here 👉 [WEAKPASS.COM](https://weakpass.com)
4. `192.168.1.1` - router or server gateway
5. `output.txt` - bruteforce logs

<details><summary>

# Demo
</summary>

<img src="">
<img src="">
</details>

# About
Bruter - is an nmap based credentials bruteforce for ssh port 22 and telnet port 23.

# ⚠️ DISCLAIMERS 
**Disclaimer**: `This bruter tool is provided for educational and authorized testing purposes only. Using this script to perform unauthorized scanning, brute-force attacks, or any form of intrusion on systems or networks without explicit permission is illegal and unethical. Such actions may violate laws, regulations, or network policies and could result in severe legal consequences. Always obtain proper authorization from the system or network owner before conducting any security testing. The author is not responsible for any misuse or damage caused by this tool. Use it responsibly and at your own risk.`
