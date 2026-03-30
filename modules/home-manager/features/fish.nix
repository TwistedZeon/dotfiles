{ inputs, self, ... }: {
   flake.homeModules.fish = {
     programs.home-manager.enable = true;
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
  };
}
