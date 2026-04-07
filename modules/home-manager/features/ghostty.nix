{ inputs, self, lib, pkgs, ... }: {
   flake.homeModules.ghostty = { pkgs, lib, ... }: {
     programs.home-manager.enable = true;
       programs.ghostty = {
         enable = true;
         package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;

         # Enable for whichever shell you plan to use!
         enableFishIntegration = true;
    
         settings = {
           theme = "Adwaita Dark";
           font-family = "Roboto Mono";
           background-opacity = "0.95";
           command = "SHELL=${lib.getExe pkgs.fish} fish";
           maximize = true;
      };
    };
  };
}
