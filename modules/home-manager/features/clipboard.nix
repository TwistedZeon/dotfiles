{ inputs, self, ... }: {
   flake.homeModules.clipboard = {
     programs.home-manager.enable = true;
       services.cliphist = {
         enable = true;

         systemdTargets = ["graphical-session.target"];

         extraOptions = [
           "-max-items"
           "500"
         ];
         allowImages = true;
       };
     };
}
