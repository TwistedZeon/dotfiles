{ inputs, self, ... }: {
   flake.homeModules.fish = {
     programs.fish.enable = true;
   };
}
