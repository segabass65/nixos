{ ... }: {
  xsession.windowManager.bspwm = {
    enable = true;
    
    monitors = {
      DP-2 = [ "1" "2" "3" "4" "5" ];
      DP-0 = [ "6" "7" "8" "9" "10" ];
    };

    settings = {
      pointer_follows_monitor = true;
      focus_follows_pointer = true;
      pointer_follows_focus = true;

      border_width = 2;
      window_gap = 10;

      bottom_padding = 27;
      left_padding = 5;
      right_padding = 5;
      top_padding = 5;

      active_border_color = "#45475a";
      focused_border_color = "#cba6f7";
      normal_border_color = "#45475a";
    };

    startupPrograms = [
      "systemctl --user restart polybar.service"
    ];
  };
}
