{ self, inputs, ... }: {
  flake.nixosModules.git = { pkgs, ... }: {
    enviroment.systemPackages = [
      pkgs.git
    ];
  };  
}
