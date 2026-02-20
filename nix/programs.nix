{ config, pkgs, ... }:

{
  home.packages = with pkgs; [

    # ─── Essentials / Core CLI Tools ───
    git
    wget
    curl
    tree
    fd
    ripgrep
    bat
    dos2unix
    tldr
    fastfetch
    lazygit
    tmux
    htop
    fzf

    # ─── Audio / Media / Fun ───
    yt-dlp
    pipewire
    pulseaudio
    alsa-utils
    alsa-plugins
    ani-cli
    termusic
    mangal
    mov-cli
    figlet
    lolcat

    # ─── Networking / Sysadmin / Misc ───
    nmap
    httpie
    jq        # JSON CLI parser
    yq        # YAML CLI parser
    fping
    ncdu
    wslu      # WSL utilities

    # ─── UNUSED / Optional / Commented Out ───
    # starship      # fancy shell prompt
    # autojump      # directory jump
    # cmatrix       # matrix effect
    # sl            # steam locomotive animation
    # asciinema     # terminal screencasts
    # joplin        # note-taking app
    # logseq        # note-taking app

    ### ─── CODING STUFF TO INSTALL MANUALLY (DO NOT INSTALL VIA NIX) ───
    # nodejs        # install via nvm (includes npm)
    # npm           # comes with nodejs via nvm
    # python3       # install via apt or pyenv
    # python3Packages.pip  # install manually after python3
    # go            # install manually from official Go
    # rustup        # install manually from rustup.rs
    # gcc           # install manually if needed
    # gdb           # install manually if needed
    # cmake         # install manually if needed
    # docker        # install manually from official Docker guide
    # docker-compose
  ];
}
