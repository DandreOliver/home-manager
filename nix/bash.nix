{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    initExtra = ''
      # Add bash folder first so custom executables like mpv are found
      export PATH="$HOME/.config/home-manager/bash:$HOME/.local/bin:$HOME/.nix-profile/bin:$PATH"
      export PATH="$PATH:/mnt/c/Users/dandr/AppData/Local/Microsoft/WindowsApps"
      # Default editor
      export EDITOR=nvim

      # Bootstrap bash modules (functions, aliases, etc.)
      BASH_DIR="$HOME/.config/home-manager/bash"
      if [ -d "$BASH_DIR" ]; then
        for file in "$BASH_DIR"/*.sh; do
          [ -r "$file" ] && source "$file"
        done
      fi
    '';
  };
}

