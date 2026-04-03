{ ... }: {
  home.file = {
    ".local/bin/toggle_floating_sticky.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        if bspc query -N -n focused.tiled; then
            bspc node -g private
        else
            bspc node -g sticky
        fi
      '';
    };

    ".local/bin/toggle_floating.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        if bspc query -N -n focused.tiled; then
            bspc node -t floating
        else
            bspc node -t tiled
        fi
      '';
    };
    
    ".local/bin/toggle_tiled_sticky.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        if bspc query -N -n focused.tiled; then
            bspc node -g sticky
        else
            bspc node -g private
        fi
      '';
    };
  };
}
