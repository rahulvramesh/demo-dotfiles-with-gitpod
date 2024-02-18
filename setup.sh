#!/bin/bash

# Idempotency and conditional installation
[[ "$(command -v apt-get)" || "$(command -v apt)" ]] && {
  sudo apt update
  if [[ ! $(command -v build-essential) ]]; then
    sudo apt-get install -y build-essential
  fi
}

# Snap installation (use the appropriate command for your version)
SNAP_VERSION="latest"
if [[ ! $(command -v btop) ]]; then
  # Use snap install based on your desired installation approach
  sudo snap install --classic "btop=$SNAP_VERSION"
  # Or use snap switch if you have multiple versions installed
  # sudo snap switch --global btop $SNAP_VERSION
fi

# # Homebrew installation (check if already installed)
# if [[ ! -d "/home/linuxbrew/.linuxbrew/bin" ]]; then
#   curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
# fi

# # Homebrew shell environment (if Homebrew is installed)
# if [[ -d "/home/linuxbrew/.linuxbrew/bin" ]]; then
#   (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/coder/.bashrc
# fi

# # Execute Homebrew's shellenv (if enabled)
# if [[ -f "/home/coder/.bashrc" ]]; then
#   source /home/coder/.bashrc
# fi

# # Install Tailscale (if Homebrew is installed)
# if [[ -d "/home/linuxbrew/.linuxbrew/bin" ]]; then
#   brew install tailscale
# fi
if [[ ! $(command -v tailscale) ]]; then
  curl -fsSL https://tailscale.com/install.sh | sh
fi

