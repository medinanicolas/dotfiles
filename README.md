# Dotfiles Quick Setup

Instructions for Arch / Ubuntu / Debian.

## 1. Install Git

* **Ubuntu/Debian:** `sudo apt update && sudo apt install git -y`
* **Arch:** `sudo pacman -Syu --needed git --noconfirm`

## 2. Setup Dotfiles

```bash
git clone https://github.com/medinanicolas/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

chmod +x setup_packages.sh
sudo ./setup_packages.sh

stow .

