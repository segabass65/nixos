{ pkgs, ... }: {
  home.packages = with pkgs; [
    argbash
    cmatrix
    efibootmgr
    git-filter-repo
    hsetroot
    htop
    maim
    nerd-fonts.jetbrains-mono
    ouch
    protonup-rs
    tree
    tty-clock
    ventoy
    wget
    wmutils-core
    xclip
    xtitle
  ];
}