{ theme, ... }: {
  environment.etc = {
    "xdg/cava/config".text = ''
      [color]
      theme = '${theme}.cava'
    '';

    "xdg/cava/themes/frappe.cava".source =
      ./themes/frappe.cava;

    "xdg/cava/themes/latte.cava".source =
      ./themes/latte.cava;

    "xdg/cava/themes/macchiato.cava".source =
      ./themes/macchiato.cava;

    "xdg/cava/themes/mocha.cava".source =
      ./themes/mocha.cava;
  };
}
