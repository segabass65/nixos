{ inputs, pkgsUnstable, ... }: {
  imports = [
    ./segabass65.nix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit pkgsUnstable;
    };
    
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
