{ inputs, self, ... }: {
    flake.nixosModules.homeManager = { config, pkgs, ... }: {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      
      home-manager.backupFileExtension = "backup";
      
      home-manager.users.zeon = { config, pkgs, ... }: {
        # all you home modules here
        imports = [
          self.homeModules.fish
          self.homeModules.fastfetch
          self.homeModules.ghostty
          self.homeModules.vesktop
        ];
      
        home.stateVersion = "25.11";
      };
 };
}
