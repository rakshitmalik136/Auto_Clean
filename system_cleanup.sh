#!/bin/bash

<<NOTE
This script will first checks for operating system then automates the system cleanup for that particular operating system.
NOTE

# Function to detect OS
detect_os() {
	if [[ $OSTYPE == "linux-gnu"* ]];
	then
		if [ -f /etc/os-release ];
		then
			. /etc/os-release
			OS=$ID
		fi
	elif [[ $OSTYPE == "darwin"* ]];
	then
		OS="macos"
	else
		OS="Unknown"
	fi
}

# Fuction to clean Ubuntu/Debian system
clean_debian() {
    echo "[+] Cleaning Debian/Ubuntu system..."
    sudo apt update && sudo apt autoremove -y
    sudo apt clean && sudo apt autoclean
    sudo journalctl --vacuum-time=7d
    sudo rm -rf ~/.cache/thumbnails/*
    echo "[+] Debian/Ubuntu cleanup complete."
}

# Function to clean Red Hat-based systems
clean_rhel() {
    echo "[+] Cleaning RHEL/CentOS/Fedora system..."
    sudo dnf autoremove -y || sudo yum autoremove -y
    sudo dnf clean all || sudo yum clean all
    sudo journalctl --vacuum-time=7d
    sudo rm -rf ~/.cache/thumbnails/*
    echo "[+] RHEL/CentOS/Fedora cleanup complete."
}

# Function to clean macOS systems
clean_macos() {
    echo "[+] Cleaning macOS system..."
    sudo rm -rf ~/Library/Caches/*
    sudo rm -rf /Library/Caches/*
    sudo rm -rf /System/Library/Caches/*
    sudo rm -rf ~/.Trash/*
    echo "[+] macOS cleanup complete."
}

# Main Script
detect_os
echo "[*] Detected OS: $OS"

case "$OS" in
    ubuntu|debian)
        clean_debian
        ;;
    rhel|centos|fedora)
        clean_rhel
        ;;
    macos)
        clean_macos
        ;;
    *)
        echo "[-] Unsupported or unknown OS: $OSTYPE"
        ;;
esac



