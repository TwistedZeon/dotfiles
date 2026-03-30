{ inputs, self, ... }: {
    flake.nixosModules.homeManager = { config, pkgs, ... }: {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      
      home-manager.users.zeon = { config, pkgs, ... }: {
        # all you home modules here
        imports = [
          self.homeModules.apps
          # self.homeModules.fastfetch
          # self.homeModules.ghostty
        ];
      
        home.stateVersion = "25.11";
      };
 };
}
