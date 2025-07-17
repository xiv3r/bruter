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
