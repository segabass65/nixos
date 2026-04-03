{ ... }: {
  services.polybar = {
    enable = true;
    script = ''
      polybar bspwm-DP-2 &
      polybar bspwm-DP-0 &
    '';
    
    settings = {
      "bar/bspwm-DP-2" = {
        "inherit" = "bar/bspwm";

        monitor = "DP-2";
        modules-center = "bspwm-tray";
      };

      "bar/bspwm-DP-0" = {
        "inherit" = "bar/bspwm";

        monitor = "DP-0";
      };

      "bar/bspwm" = {
        modules-left = "nixos bspwm-workspaces";
        modules-right = "bspwm-flags bspwm-keyboard bspwm-date";

        background = "\${colors.crust}";
        border-color = "\${colors.surface1}";
        foreground = "\${colors.text}";

        border-top-size = "2px";
        height = "20px";
        bottom = true;

        font-0 = "JetBrainsMono Nerd Font:style=Bold:size=10;3";

        override-redirect = true;
        wm-restack = "bspwm";
      };

      "module/arch" = {
        type = "custom/text";

        label = "   ";
        label-background = "\${colors.mantle}";
      };

      "module/nixos" = {
        type = "custom/text";

        label = "   ";
        label-background = "\${colors.mantle}";
      };

      "module/bspwm-workspaces" = {
        type = "internal/xworkspaces";

        pin-workspaces = true;

        label-active = " %name% ";
        label-active-background = "\${colors.mauve}";
        label-active-foreground = "\${colors.crust}";

        label-occupied = " %name% ";
        label-occupied-background = "\${colors.mantle}";

        label-empty = "";
      };

      "module/bspwm-tray" = {
        type = "internal/tray";

        tray-size = "100%";
        tray-spacing = "20px";
      };

      "module/bspwm-flags" = {
        type = "internal/bspwm";

        format = "<label-mode>";

        label-monocle = " 󰥶 ";
        label-monocle-background = "\${colors.blue}";
        label-monocle-foreground = "\${colors.crust}";

        label-locked = "  ";
        label-locked-background = "\${colors.red}";
        label-locked-foreground = "\${colors.crust}";

        label-sticky = "  ";
        label-sticky-background = "\${colors.peach}";
        label-sticky-foreground = "\${colors.crust}";

        label-private = "  ";
        label-private-background = "\${colors.peach}";
        label-private-foreground = "\${colors.crust}";

        label-marked = " 󰄵 ";
        label-marked-background = "\${colors.green}";
        label-marked-foreground = "\${colors.crust}";
      };

      "module/bspwm-keyboard" = {
        type = "internal/xkeyboard";

        blacklist-0 = "num lock";
        blacklist-1 = "scroll lock";

        format = "<label-layout><label-indicator>";

        label-layout = "   %layout% ";
        label-layout-background = "\${colors.mantle}";

        label-indicator-on-capslock = " 󰌎 ";
        label-indicator-on-capslock-background = "\${colors.mauve}";
        label-indicator-on-capslock-foreground = "\${colors.crust}";
      };

      "module/bspwm-date" = {
        type = "internal/date";

        time = "%H:%M";
        
        label = " 󱑎 %time% ";
        label-background = "\${colors.mantle}";
      };
    };
  };
}
