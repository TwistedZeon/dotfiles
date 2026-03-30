{ inputs, self, ... }: {
   flake.homeModules.apps = { pkgs, lib, ... }: {
     programs.home-manager.enable = true;
       
       # Fish
       programs.fish = {
         enable = true;
         interactiveShellInit = ''
           set fish_greeting # Disable greeting
           fastfetch
         '';
         functions = {
      
           server-u = "sudo mount -t nfs 192.168.0.205:/4TB /mnt/Server4TB";
         };
       };
       
       # Fastfetch
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
       
       # Ghostty
       programs.ghostty = {
         enable = true;
         
         # Enable for whichever shell you plan to use!
         enableFishIntegration = true;
    
         settings = {
           theme = "Adwaita Dark";
           background-opacity = "0.95";
           command = "SHELL=${lib.getExe pkgs.fish} fish";
         };
     };
   };
}
