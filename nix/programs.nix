  { config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # ─── Essentials ───
    wslu
    alsa-utils
    alsa-plugins
    pipewire
    pulseaudio
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
    # ─── Fun / CLI Utilities ───
    mpv
    ani-cli
    mangal
    mov-cli
    termusic  
    figlet
    lolcat
    # ─── Networking / Hacking / Misc ───
    nmap
    wget
    curl
    httpie
    jq        # JSON CLI parser
    yq        # YAML CLI parser
    tree-sitter # dev tool
    fping
    ncdu  

    #UNUSED#
    # ─── Shell / Productivity ───
    #zsh
   # starship   # fancy shell prompt
    #autojump
    #tmuxinator # tmux session manager
    #
    #cmatrix
    #sl         # steam locomotive lol
    #asciinema # terminal screencasts
    #cowsay
    #joplin
    #logseq
    ];
  }
