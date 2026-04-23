{ config, ... }: {
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = config.home.username;
          email = "segabass65@proton.me";
        };
      };
    };
  };
}
