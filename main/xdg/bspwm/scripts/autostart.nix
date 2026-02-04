{ ... }: {
  environment.etc."xdg/bspwm/scripts/autostart.sh" = {
    mode = "0755";
    text = ''
      #!/bin/sh
    
      pkill -x sxhkd
      sxhkd -c /etc/xdg/bspwm/sxhkdrc &
      
      feh --bg-scale /etc/assets/wallpapers/2.png

      pkill -x picom
      picom -b

      pkill -x polybar
      polybar bspwm-DP-2 &
      polybar bspwm-DP-0 &
    '';
  };
}
