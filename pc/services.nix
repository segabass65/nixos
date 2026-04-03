{ ... }: {
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    dpi = 96;
    xkb = {
      layout = "us, ru";
      options = "grp:alt_shift_toggle";
    };
    xrandrHeads = [
      {
        output = "HDMI-0";
        monitorConfig = ''Option "Enable" "false"'';
      }
      {
        output = "DP-2";
        primary = true;
      }
      {
        output = "DP-0";
        monitorConfig = ''Option "RightOf" "DP-2"'';
      }
    ];
  };
}
