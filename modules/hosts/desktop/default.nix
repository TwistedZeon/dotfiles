{ self,inputs, ... }: {
  flake.nixosConfigurations.NixOSParts = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.NixOSPartsConfiguration
    ];
  };
}
