{ ... }: {
  imports = [
    ./policies.nix
    ./settings.nix
  ];

  programs.librewolf = {
    enable = true;
    profiles.default = {
      name = "default";
      extensions.force = true;
    };
  }; 
}
