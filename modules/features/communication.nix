{ self, inputs, ... }: {
  flake.nixosModules.communication = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.arrpc
      pkgs.mumble
      pkgs.thunderbird
    ];
    systemd.packages = [ pkgs.arrpc ];
  };  
}
