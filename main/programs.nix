{ ... }: {
  programs = {
    amnezia-vpn.enable = true;
    firejail.enable = true;
    steam.enable = true;
    throne = {
      enable = true;
      tunMode.enable = true;
    };
    virt-manager.enable = true;
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}
