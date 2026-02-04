{ ... }: {
  environment.etc."xdg/bspwm/scripts/setup_workspaces.sh" = {
    mode = "0755";
    text = ''
      #!/bin/sh
    
      bspc monitor DP-2 -d 1 2 3 4 5
      bspc monitor DP-0 -d 6 7 8 9 10
    '';
  };
}
