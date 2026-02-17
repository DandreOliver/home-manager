# ~/.config/home-manager/starship.nix
{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {}; # optional if you only use starship.toml
  };

  xdg.configFile."starship.toml".source = ./starship.toml;
}

