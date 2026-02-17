# ~/.config/home-manager/starship.nix
{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    # Path must be inside home directory, not nix store
    configPath = "${config.home.homeDirectory}/.config/home-manager/starship.toml";
  };
}

