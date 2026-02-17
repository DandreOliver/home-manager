# ~/.config/home-manager/bash.nix
{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    initExtra = ''
      # Only run bootstrap in interactive shells
      [[ $- != *i* ]] && return

      # PATH
      export PATH="$HOME/.local/bin:$HOME/.nix-profile/bin:$PATH"

      # Default editor
      export EDITOR=nvim

      # Bootstrap bash modules
      BASH_DIR="$HOME/.config/home-manager/bash"
      if [ -d "$BASH_DIR" ]; then
        for file in "$BASH_DIR"/*.sh; do
          [ -r "$file" ] && source "$file"
        done
      fi
    '';
  };
}

