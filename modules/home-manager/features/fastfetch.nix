{ inputs, self, ... }: {
   flake.homeModules.fastfetch = {
     programs.home-manager.enable = true;
       programs.fastfetch = {
         enable = true;
         settings = {
           logo = {
             source = "nixos";
             padding = { right = 1; };
           };
           display = {
             size = { binaryPrefix = "si"; };
             color = "blue";
             separator = ": ";
           };
           modules = [
             "title"
             "separator"
             "os"
             "host"
             "kernel"
             "uptime"
             "packages"
             "shell"
             "terminal"
             "cpu"
             "gpu"
             "memory"
             "break"
             "colors"
           ];
         };
       };
     };
}
