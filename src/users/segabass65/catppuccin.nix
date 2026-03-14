{ osConfig, ... }: {
  catppuccin = if osConfig != null then
    {
      enable = osConfig.catppuccin.enable;
      accent = osConfig.catppuccin.accent;
      flavor = osConfig.catppuccin.flavor;
    }

  else
    {
      enable = true;
    };
}
