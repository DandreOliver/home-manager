{ config, pkgs, ... }:

{
  programs.cava = {
    enable = true;

    settings = {
      general = {
        framerate = 60;
        bars = 64;
        sensitivity = 100;
        lower_cutoff_freq = 50;
        higher_cutoff_freq = 10000;
        autosens = 1;
        overshoot = 20;
      };

      input = {
        method = "pulse";
        source = "RDPSink.monitor";
      };

      output = {
        method = "ncurses";
        channels = "stereo";
        mono_option = "average";
      };

      smoothing = {
        monstercat = 1;
        waves = 0;
        noise_reduction = 77;
      };

      color = {
        gradient = 1;
        gradient_count = 4;
        gradient_color_1 = "'#89b4fa'";
        gradient_color_2 = "'#cba6f7'";
        gradient_color_3 = "'#f38ba8'";
        gradient_color_4 = "'#a6e3a1'";
      };
    };
  };
}

