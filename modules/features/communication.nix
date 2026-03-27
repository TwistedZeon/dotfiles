{ self, inputs, ... }: {
  flake.nixosModules.communication = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.vesktop
      pkgs.mumble
      pkgs.thunderbird
    ];
  };  
}
