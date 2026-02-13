# ~/.config/home-manager/bashrc.nix
{ config, pkgs, ... }:

{
  programs.bash.initExtra = ''
    # Custom bashrc additions
    export PATH="$HOME/.local/bin:$PATH"
    export EDITOR=nvim
    alias ll="ls -lah"
  '';
}

