#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

echo "🚀 Bootstrapping WSL + Nix + Home Manager environment"

# ----------------------------
# 1️⃣ Check WSL
# ----------------------------
if ! command -v wsl.exe &>/dev/null; then
  echo "❌ WSL not found. Please install WSL first:"
  echo "   https://learn.microsoft.com/en-us/windows/wsl/install"
  exit 1
fi
echo "✅ WSL detected"

# ----------------------------
# 2️⃣ Check Nix
# ----------------------------
if ! command -v nix &>/dev/null; then
  echo "ℹ️ Nix not found. Installing Nix..."
  sh <(curl -L https://nixos.org/nix/install) --no-daemon
  echo "✅ Nix installed"
else
  echo "✅ Nix already installed"
fi

# Load Nix environment for current shell
if [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# ----------------------------
# 3️⃣ Check Home Manager flake
# ----------------------------
if ! nix flake list | grep -q home-manager; then
  echo "ℹ️ Home Manager flake not found. Adding it..."
  nix flake add github:nix-community/home-manager
  echo "✅ Home Manager added"
fi

# ----------------------------
# 4️⃣ Update flake inputs
# ----------------------------
echo "🔹 Updating flake inputs..."
nix flake update

# ----------------------------
# 5️⃣ Apply Home Manager configuration
# ----------------------------
if [ ! -f "$HOME/.config/home-manager/home.nix" ]; then
  echo "❌ Home Manager repo not found at ~/.config/home-manager"
  echo "   Please clone your repo first, e.g.:"
  echo "   git clone <your_repo_url> ~/.config/home-manager"
  exit 1
fi

echo "🔹 Applying Home Manager configuration..."
home-manager switch --flake "$HOME/.config/home-manager#$(whoami)"

# ----------------------------
# 6️⃣ Source bash modules
# ----------------------------
BASH_DIR="$HOME/.config/home-manager/bash"
if [ -d "$BASH_DIR" ]; then
  echo "🔹 Sourcing bash modules..."
  for file in "$BASH_DIR"/*.sh; do
    [ -r "$file" ] && source "$file"
  done
fi

echo "✅ Bootstrapping complete! Your WSL environment is ready."

