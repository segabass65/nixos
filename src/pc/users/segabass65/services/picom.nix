{ pkgs, ... }: {
  services.picom = {
    enable = true;
    backend = "glx";
    package = pkgs.picom-pijulius;
    settings = {
      corner-radius = 10;
      rounded-corners-exclude = [
        "window_type = 'dock'"
        "class_g = 'Polybar'"
      ];
    };
  };
}
