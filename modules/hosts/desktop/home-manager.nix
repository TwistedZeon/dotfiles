{ inputs, self, ... }: {
    flake.nixosModules.homeManager = { ... }: {
    };

    flake.nixosModules.desktopConfiguration = { config, pkgs, ... }: {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
    
      home-manager.users.zeon = { config, pkgs, ... }: {
        # all you home modules here
        imports = [
          self.homeModules.fish
        ];
      
        home.stateVersion = "25.11";
      };
   };
 
   flake.homeModules.fish = {
     programs.fish.enable = true;
   };
}
