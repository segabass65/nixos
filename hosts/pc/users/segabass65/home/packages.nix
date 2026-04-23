{ pkgs, ... }: {
  home.packages = with pkgs; [
    cmatrix
    efibootmgr
    git-filter-repo
    hsetroot
    htop
    krita
    maim
    nerd-fonts.jetbrains-mono
    ouch
    protonup-rs
    topydo
    tree
    tty-clock
    ventoy
    wget
    xclip
  ];
}