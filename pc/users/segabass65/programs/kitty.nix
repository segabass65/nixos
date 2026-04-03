{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
    };
    settings = {
      enable_audio_bell = false;
      
      cursor_shape = "beam";
      cursor_shape_unfocused = "unchanged";
      cursor_trail = 1;
      
      tab_bar_style = "separator";
      tab_separator = "\"\"";
      tab_title_template = "\" {title} \"";
    };
  };
}
