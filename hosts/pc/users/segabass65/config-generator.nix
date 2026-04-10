{ inputs, ... }: {
  xdg.configFile = {
    "config-generator/sxhkd/sxhkdrc" = {
      text = inputs.config-generator.lib.toSxhkd {
        keybindings = {
          "super + k" =
            "echo Hello World";
        };

        extraConfig = ''
          super + e
            echo Hello World
        '';
      };
    };

    "config-generator/polybar/config.ini" = {
      text = inputs.config-generator.lib.toPolybar {
        config = {
          "module/config" = {
            type = "custom/text";
            label = "Hello World";
          };
        };

        settings = {
          "module/settings" = {
            type = "custom/text";
            label = "Hello World";
          };
        };

        extraConfig = ''
          [module/extraConfig]
          type=custom/text
          label=Hello World
        '';
      };
    };
  };
}
