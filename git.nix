# ~/.config/home-manager/git.nix
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    # Git user info
    settings.user.name  = "Dandre Oliver";
    settings.user.email = "dandrecoliver@gmail.com";

    # Default editor
    settings.core.editor = "nvim";
  };
}

