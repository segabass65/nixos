{ ... }: {
  environment.etc."xdg/bspwm/scripts/toggle_floating.sh" = {
    mode = "0755";
    text = ''
      #!/bin/sh
  
      if bspc query -N -n focused.tiled; then
          bspc node -t floating
      else
          bspc node -t tiled
      fi
    '';
  };
}
