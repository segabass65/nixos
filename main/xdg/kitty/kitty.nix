{ theme, ... }: {
  environment.etc = {
    "xdg/kitty/kitty.conf".text = ''
      include themes/${theme}.conf


      confirm_os_window_close 0
      enable_audio_bell no
      font_family family="JetBrainsMono Nerd Font"
      remember_window_size  no
      url_style straight

      cursor_shape beam
      cursor_shape_unfocused unchanged
      cursor_trail 1

      tab_bar_style separator
      tab_separator ""
      tab_title_template " {title} "
    '';

    "xdg/kitty/themes/frappe.conf".source =
      ./themes/frappe.conf;

    "xdg/kitty/themes/latte.conf".source =
      ./themes/latte.conf;

    "xdg/kitty/themes/macchiato.conf".source =
      ./themes/macchiato.conf;

    "xdg/kitty/themes/mocha.conf".source =
      ./themes/mocha.conf;
  };
}
