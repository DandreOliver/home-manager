# ~/.config/home-manager/bash/aliases.sh

# Navigation
alias ll='ls -lah'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'

# Git
alias gs='git status'
alias gl='git log --oneline --graph --decorate --all'
alias gco='git checkout'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'

# Home Manager shortcuts
alias fd='cd ~/'
alias cdwin='cd /mnt/c/Users/dandr/'
alias hmcd='cd ~/.config/home-manager/nix/'
alias nfu='(cd ~/.config/home-manager/nix/ && nix flake update)'
alias hmsw='(cd ~/.config/home-manager/nix/ && nix run home-manager/master -- switch --flake ~/.config/home-manager/nix/#k0mrade)'
