# ~/.config/home-manager/home.nix
{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";
  home.username = "k0mrade";
  home.homeDirectory = "/home/k0mrade";

  # Automatically backup any files that Home Manager is going to overwrite
	#
imports = [
  ./git.nix
  ./ani-cli.nix
  ./bash.nix
  ./neovim.nix
  ./lazygit.nix
  ./gh.nix
  ./starship.nix
  ./sessionVariables.nix
  ./programs.nix
  ./tmux.nix
];

}

