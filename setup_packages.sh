#!/bin/bash

# Script to install required packages, tools, Oh My Zsh,
# and common Zsh plugins/themes for the dotfiles setup.

# --- Helper function for logging ---
log() {
  echo "[INFO] $1"
}

# --- Install function for Arch Linux ---
install_arch() {
  log "Detected Arch Linux. Updating system and installing packages..."
  sudo pacman -Syu --noconfirm --needed \
    git \
    stow \
    zsh \
    curl \
    wget \
    terminator \
    neovim \
    ripgrep \
    lua \
    luarocks \
    base-devel # For building packages if needed

  # Add any other Arch-specific packages here
  log "Arch package installation complete."
}

# --- Install function for Debian/Ubuntu ---
install_ubuntu() {
  log "Detected Debian/Ubuntu. Updating system and installing packages..."
  sudo apt update
  sudo apt install -y --no-install-recommends \
    git \
    stow \
    zsh \
    curl \
    wget \
    terminator \
    neovim \
    ripgrep \
    lua5.4 \
    luarocks \
    build-essential # For building packages if needed

  # Add any other Debian/Ubuntu-specific packages here
  log "Debian/Ubuntu package installation complete."
}

# --- Install Oh My Zsh ---
install_oh_my_zsh() {
  if [ -d "$HOME/.oh-my-zsh" ]; then
    log "Oh My Zsh already installed."
  else
    log "Installing Oh My Zsh..."
    # Run the installer non-interactively
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    if [ $? -eq 0 ]; then
        log "Oh My Zsh installation finished."
    else
        log "[ERROR] Oh My Zsh installation failed."
        # Optionally exit here if OMZ is critical
        # exit 1
    fi
  fi
}

# --- Install Common External Zsh Plugins & Themes ---
install_zsh_extras() {
    # Check if OMZ installation path exists before proceeding
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        log "[WARN] Oh My Zsh directory not found. Skipping Zsh extras installation."
        return
    fi

    ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom} # Define custom path
    log "Checking/installing Zsh extras into $ZSH_CUSTOM..."

    # zsh-autosuggestions
    if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
      log "Cloning zsh-autosuggestions..."
      git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
    else
      log "zsh-autosuggestions already present."
    fi

    # zsh-syntax-highlighting
    if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
      log "Cloning zsh-syntax-highlighting..."
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
    else
      log "zsh-syntax-highlighting already present."
    fi

    # Powerlevel10k Theme
    if [ ! -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]; then
      log "Cloning powerlevel10k theme..."
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k"
    else
      log "powerlevel10k theme already present."
    fi

    # Add git clone commands for any other custom/external plugins/themes here...

    log "Zsh extras check/installation complete."
}


# --- Change Default Shell ---
set_zsh_default() {
  if [ "$SHELL" != "$(which zsh)" ]; then
    log "Attempting to set Zsh as default shell..."
    # Ensure zsh is actually installed before trying to set it
    if command -v zsh &> /dev/null; then
        if chsh -s "$(which zsh)"; then
          log "Default shell changed to Zsh. Please log out and log back in for the change to take effect."
        else
          log "[ERROR] Failed to change default shell via chsh. Please do it manually: chsh -s $(which zsh)"
        fi
    else
        log "[ERROR] zsh command not found. Cannot set as default shell."
    fi
  else
    log "Zsh is already the default shell."
  fi
}


# --- Main Execution ---
log "Starting dotfiles setup script..."

# 1. Detect OS and install system packages
if command -v pacman &> /dev/null; then
  install_arch
elif command -v apt &> /dev/null; then
  install_ubuntu
else
  log "[ERROR] Unsupported package manager. Cannot install dependencies. Exiting."
  exit 1
fi

# 2. Install Oh My Zsh
install_oh_my_zsh

# 3. Install common external Zsh plugins/themes
install_zsh_extras

# 4. Set Zsh as default shell
set_zsh_default

# --- Reminder ---
log "---------------------------------------------------------------------"
log "IMPORTANT: Ensure your stowed ~/.zshrc file correctly lists:"
log "  - plugins=(... zsh-autosuggestions zsh-syntax-highlighting ...)"
log "  - ZSH_THEME=\"powerlevel10k/powerlevel10k\""
log "  (Adjust the plugins list according to what you actually use!)"
log "---------------------------------------------------------------------"


log "Setup script finished!"
log "Please review any errors above."
log "If Zsh was set as default, please log out and log back in."

exit 0

