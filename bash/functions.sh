# ~/.config/home-manager/bash/functions.sh

ff() {
  command fastfetch || echo "fastfetch not installed"
}

lg() {
  export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
  command lazygit "$@"
  if [ -f "$LAZYGIT_NEW_DIR_FILE" ]; then
    cd "$(cat "$LAZYGIT_NEW_DIR_FILE")"
    rm -f "$LAZYGIT_NEW_DIR_FILE" > /dev/null
  fi
}

hmsw() {
  [[ $- != *i* ]] && return 1   # Only interactive shells

  local HM_DIR="$HOME/.config/home-manager"
  local USERNAME
  USERNAME="$(whoami)"

  if [ ! -d "$HM_DIR" ]; then
    echo "❌ Home Manager directory not found: $HM_DIR"
    return 1
  fi

  cd "$HM_DIR" || return 1
  echo "🏠 Switching Home Manager for user: $USERNAME"

  nix run github:nix-community/home-manager -- \
    switch --flake ".#${USERNAME}"
}

