{ pkgs, ... }: {
  home.packages = with pkgs; [
    argbash
    cmatrix
    efibootmgr
    git-filter-repo
    gnumake
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
    wmutils-core
    xclip
    xtitle
  ];
}