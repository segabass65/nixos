{ ... }: {
  environment.etc."xdg/bspwm/scripts/toggle_floating_sticky.sh" = {
    mode = "0755";
    text = ''
      #!/bin/sh

      if bspc query -N -n focused.tiled; then
          bspc node -g private
      else
          bspc node -g sticky
      fi
    '';
  };
}
