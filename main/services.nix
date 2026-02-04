{ ... }: {
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    xserver = {
      enable = true;
      dpi = 96;
      windowManager.bspwm.enable = true;
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
  };
}
