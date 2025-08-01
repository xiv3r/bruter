# Platforms
- Kali/Debian/Ubuntu
- Termux

# Installation
- Kali
```
sudo apt update && sudo apt install nmap git wget -y && clear && wget -qO- https://raw.githubusercontent.com/xiv3r/bruter/refs/heads/main/install.sh | sudo bash && cd bruter && ls
```
- Termux
```
pkg update && pkg install git nmap -y && clear && git clone https://github.com/xiv3r/bruter.git && chmod 755 bruter/bruter.sh && cd bruter && ls
```
<details><summary> Termux
</summary>

```
pkg update && pkg install nmap wget -y && wget -qO- https://raw.githubusercontent.com/xiv3r/bruter/refs/heads/main/install.sh | bash && cd bruter && ls
```
</details>

# Usage

```
bash Bruter.sh
```

or

- SSH
```
./bruter.sh ssh users.txt passwords.txt 192.168.1.1 output.txt
```
- TELNET
```
./bruter.sh telnet users.txt passwords.txt 192.168.1.1 output.txt
```

# Hint
1. `ssh/telnet` - target port
2. `users.txt` - ssh or telnet admin account
3. `passwords.txt` - your password wordlist or download from [Weakpass](https://weakpass.com)
4. `192.168.1.1` - router or server gateway
5. `output.txt` - bruteforce logs

# Demo
<details><summary> Expand
</summary>

## SSH

<img src="https://github.com/xiv3r/bruter/blob/main/ssh-brute.png">

## TELNET

<img src="https://github.com/xiv3r/bruter/blob/main/telnet-brute.png">
</details>


# About
Bruter - is an nmap based credentials bruteforce for ssh port 22 and telnet port 23.

# ⚠️ DISCLAIMERS 

`This bruter tool is provided for educational and authorized testing purposes only. Using this script to perform unauthorized scanning, brute-force attacks, or any form of intrusion on systems or networks without explicit permission is illegal and unethical. Such actions may violate laws, regulations, or network policies and could result in severe legal consequences. Always obtain proper authorization from the system or network owner before conducting any security testing. The author is not responsible for any misuse or damage caused by this tool. Use it responsibly and at your own risk.`
