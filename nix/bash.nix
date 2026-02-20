{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    initExtra = ''
      # Add bash folder first so custom executables like mpv are found
      export PATH="$HOME/.config/home-manager/bash:$HOME/.local/bin:$HOME/.nix-profile/bin:$PATH"
      export PATH="$PATH:/mnt/c/Users/dandr/AppData/Local/Microsoft/WindowsApps"
      export PATH="$HOME/.kilo/bin:$PATH"
      export NVM_DIR="$HOME/.nvm"
      export PATH=$PATH:/usr/local/go/bin
      export PATH="$HOME/.cargo/bin:$PATH"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
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

