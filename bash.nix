{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    initExtra = ''
      # ----------------------------
      # PATH
      # ----------------------------
      export PATH="$HOME/.local/bin:$HOME/.nix-profile/bin:$PATH"

      # ----------------------------
      # Default editor
      # ----------------------------
      export EDITOR=nvim

      # ----------------------------
      # Aliases: navigation
      # ----------------------------
      alias ll="ls -lah"
      alias la="ls -A"
      alias l="ls -CF"
      alias ..="cd .."
      alias ...="cd ../.."
      alias ....="cd ../../.."
      alias h="history"
      alias c="clear"

      # ----------------------------
      # Git aliases
      # ----------------------------
      alias gs="git status"
      alias gl="git log --oneline --graph --decorate --all"
      alias gco="git checkout"
      alias gcm="git commit -m"
      alias gp="git push"
      alias gpl="git pull"
      alias gb="git branch"
      alias ff="fastfetch"
      alias gcb="git checkout -b"
      alias grb="git rebase"
      alias gamend="git commit --amend"

      # GitHub shortcuts
      alias ghpr="gh pr create"
      alias ghprl="gh pr list"
      alias ghprv="gh pr view --web"

      # ----------------------------
      # LazyGit function
      # ----------------------------
      function lg() {
          export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
          command lazygit "$@"
          if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
              cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
              rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
          fi
      }

      # ----------------------------
      # Nix / Home Manager shortcuts
      # ----------------------------
      alias nfu='(cd ~/.config/home-manager && nix flake update)'

      # Updated flakes-compatible Home Manager switch alias
      function hmsw() {
          cd ~/.config/home-manager || return
          if command -v home-manager &>/dev/null; then
              # fallback if home-manager binary is in PATH
              home-manager switch --flake .#k0mrade
          else
              # flakes-compatible run if binary is missing
              nix run github:nix-community/home-manager -- switch --flake .#k0mrade
          fi
      }

      # ----------------------------
      # Starship prompt
      # ----------------------------
      if command -v starship &>/dev/null; then
          eval "$(starship init bash)"
      fi
    '';
  };
}

