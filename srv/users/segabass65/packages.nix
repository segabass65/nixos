{ pkgs, ... }: {
  home.packages = with pkgs; [
    cmatrix
    htop
    ouch
    tree
    tty-clock
    wget
  ];
}
