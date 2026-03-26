{ self, inputs, ... }: {
  flake.nixosModules.mpv = { pkgs, lib, ... }: {
    programs.mpv = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.mpv;
    };
  };

  perSystem = { pkgs, ... }: {
    packages.mpv = inputs.wrapper-modules.wrappers.mpv.wrap {
      inherit pkgs;
      scripts = [
        pkgs.mpvScripts.uosc
      ];
    };
  };
}
