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
alias hmcd='cd ~/.config/home-manager'
alias nfu='(cd ~/.config/home-manager && nix flake update)'
#alias hmsw='(cd ~/.config/home-manager && nix run home-manager/master -- switch --flake ~/.config/home-manager#k0mrade)'
