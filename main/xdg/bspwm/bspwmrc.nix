{ ... }: {
  imports = [
    ./scripts/autostart.nix
    ./scripts/setup_workspaces.nix
    ./scripts/toggle_floating_sticky.nix
    ./scripts/toggle_floating.nix
    ./scripts/toggle_tiled_sticky.nix
    ./sxhkdrc.nix
  ];

  environment.etc."xdg/bspwm/bspwmrc" = {
    mode = "0755";
    text = ''
      #!/bin/sh
      
      /etc/xdg/bspwm/scripts/autostart.sh
      /etc/xdg/bspwm/scripts/setup_workspaces.sh
      
      bspc config pointer_follows_monitor true
      bspc config focus_follows_pointer true
      bspc config pointer_follows_focus true
      
      bspc config border_width 2
      bspc config window_gap 10
      
      bspc config bottom_padding 5
      bspc config left_padding 5
      bspc config right_padding 5
      bspc config top_padding 5
      
      bspc config active_border_color "#45475a"
      bspc config focused_border_color "#cba6f7"
      bspc config normal_border_color "#45475a"
    '';
  };
}
