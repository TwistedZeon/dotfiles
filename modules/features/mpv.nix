{ self, inputs, ... }: {
  flake.nixosModules.mpv = { pkgs, ... }: {
    environment.systemPackages = [
      ( pkgs.mpv.override { scripts = [
        pkgs.mpvScripts.uosc
        pkgs.mpvScripts.thumbfast
      ]; } )
    ];
  };  
}
