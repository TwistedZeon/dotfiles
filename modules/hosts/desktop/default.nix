{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.desktop = inputs.nixpkgs-patcher.lib.nixosSystem {
    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
      };
    };

    modules = [
      self.nixosModules.desktopConfiguration
    ];
    specialArgs = inputs;
  };
}
