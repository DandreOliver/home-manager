# ~/.config/home-manager/home.nix
{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";
  home.username = "k0mrade";
  home.homeDirectory = "/home/k0mrade";

  # Automatically backup any files that Home Manager is going to overwrite
	#
imports = [
  ./nix/git.nix
  ./nix/ani-cli.nix
  ./nix/bash.nix
  ./nix/neovim.nix
  ./nix/lazygit.nix
  ./nix/gh.nix
  ./nix/starship.nix
  ./nix/sessionVariables.nix
  ./nix/programs.nix
  ./nix/tmux.nix
];

}

