{ ... }: {
  environment.etc."xdg/bspwm/scripts/toggle_tiled_sticky.sh" = {
    mode = "0755";
    text = ''
      #!/bin/sh
  
      if bspc query -N -n focused.tiled; then
          bspc node -g sticky
      else
          bspc node -g private
      fi
    '';
  };
}
