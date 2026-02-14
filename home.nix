# ~/.config/home-manager/home.nix
{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";
  home.username = "k0mrade";
  home.homeDirectory = "/home/k0mrade";



  imports = [
    ./git.nix
    ./ani-cli.nix
    ./bashrc.nix
    ./neovim.nix
    ./lazygit.nix
    ./gh.nix
  ];

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
    tldr

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
    zsh
    starship   # fancy shell prompt
    autojump
    tmuxinator # tmux session manager

    # ─── Fun / CLI Utilities ───
    mpv
    ani-cli
    termusic  # Youtube Music TUI
    neofetch
    cowsay
    figlet
    lolcat
    cmatrix
    sl         # steam locomotive lol
    asciinema # terminal screencasts

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

  programs.bash.enable = true;

  home.sessionVariables = {
    EDITOR  = "nvim";
    PAGER   = "less";
    BROWSER = "wslview";
  };
  programs.git.enable = true;
  programs.tmux.enable = true;
  programs.neovim.enable = true;
  programs.home-manager.enable = true;
}

