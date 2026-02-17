# ~/.config/home-manager/home.nix
{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";
  home.username = "k0mrade";
  home.homeDirectory = "/home/k0mrade";

  imports = [
    ./git.nix
    ./ani-cli.nix
    ./bash.nix
    ./neovim.nix
    ./lazygit.nix
    ./gh.nix
    #./home-manager.nix
    ./starship.nix
    ./sessionVariables.nix
  ];
  
 programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # ─── Essentials ───
    wslu
    git
    lazygit
    tmux
    htop
    fzf     
    ripgrep  
    bat      
    fd        
    tree
    wget
    yt-dlp
    curl
    dos2unix
    tldr
    #joplin
    #logseq
    fastfetch

    # ─── Programming / Dev ───
    nodejs
    python3
    python3Packages.pip
    go
    rustup
    gcc
    gdb
    cmake
    docker
    docker-compose

    # ─── Shell / Productivity ───
    #zsh
    #starship   # fancy shell prompt
    #autojump
    #tmuxinator # tmux session manager

    # ─── Fun / CLI Utilities ───
    mpv
    ani-cli
    mangal
    mov-cli
    termusic  # Youtube Music TUI
    #cowsay
    figlet
    lolcat
    #cmatrix
    #sl         # steam locomotive lol
    #asciinema # terminal screencasts

    # ─── Networking / Hacking / Misc ───
    nmap
    wget
    curl
    httpie
    jq        # JSON CLI parser
    yq        # YAML CLI parser
    tree-sitter # dev tool
    fping
    ncdu  ];


}

