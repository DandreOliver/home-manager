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
      # Custom "working directory" aliases
      # ----------------------------
      alias nfu='(cd ~/.config/home-manager && nix flake update)'
      alias hmsw='(cd ~/.config/home-manager && home-manager switch --flake .#k0mrade)'

      # ----------------------------
      # Starship prompt
      # ----------------------------
      if command -v starship &>/dev/null; then
          eval "$(starship init bash)"
      fi
    '';
  };
}

