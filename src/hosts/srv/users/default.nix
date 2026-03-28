{ inputs, pkgsUnstable, ... }: {
  imports = [
    ./segabass65.nix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit pkgsUnstable;

      isServer = true;
    };
    
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
