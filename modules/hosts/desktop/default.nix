{
    self,
    inputs,
    ...
}:
{
    flake.nixosConfigurations.desktop = inputs.nixpkgs-patcher.lib.nixosSystem {
        modules = [
            self.nixosModules.desktopConfiguration
            { nixpkgs.config.allowUnfree = true; }
        ];
        specialArgs = inputs;
    };
}
