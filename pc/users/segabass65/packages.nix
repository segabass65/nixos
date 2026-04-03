{ pkgs, ... }: {
  home.packages = with pkgs; [
    argbash
    cmatrix
    git-filter-repo
    htop
    maim
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
