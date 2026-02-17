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
  [[ $- != *i* ]] && return 1   # Only run in interactive shells

  local HM_DIR="$HOME/.config/home-manager"
  local USERNAME
  USERNAME="$(whoami)"

  if [ ! -d "$HM_DIR" ]; then
    echo "❌ Home Manager directory not found: $HM_DIR"
    return 1
  fi

  echo "🏠 Switching Home Manager for user: $USERNAME"
  
  # Use nix run with local flake path, no need to cd
  nix run "file://${HM_DIR}#${USERNAME}" -- switch --flake "${HM_DIR}#${USERNAME}"
}


