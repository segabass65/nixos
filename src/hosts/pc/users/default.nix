{ pkgsUnstable, ... }: {
  imports = [
    ./segabass65.nix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit pkgsUnstable;
    };
    
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
