{ pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      #scan.scan_timeout = 5000;   # 5 seconds
      # or disable scanning entirely
      # scan.disabled = true;
    };
  };
}

