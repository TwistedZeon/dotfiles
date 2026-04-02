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
             "display"
             "wm"
             "theme"
             "icons"
             "font"
             "cursor"
             "terminal"
             "cpu"
             "gpu"
             "memory"
             "swap"
             "disk"
             "break"
             "colors"
           ];
         };
       };
     };
}
