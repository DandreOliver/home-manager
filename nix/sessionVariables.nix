{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR  = "nvim";
    PAGER   = "less";
    BROWSER = "wslview";
  };
}
