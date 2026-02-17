{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true; # allow :vi and :vim commands
    extraConfig = ''
      set number
      set relativenumber
      syntax on
      filetype plugin indent on
    '';
  };
}

