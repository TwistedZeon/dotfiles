{ inputs, self, ... }:
{
  flake.nixosModules.homeManager =
    { config, pkgs, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      home-manager.backupFileExtension = "backup";

      home-manager.useGlobalPkgs = true;

      home-manager.users.zeon =
        { config, pkgs, ... }:
        {
          # all you home modules here
          imports = [
            # self.homeModules.autostart
            self.homeModules.fish
            self.homeModules.fastfetch
            self.homeModules.ghostty
            self.homeModules.vesktop
            self.homeModules.mangohud
            self.homeModules.dconf
            self.homeModules.mpv
            self.homeModules.clipboard
            # self.homeModules.vscodium
            self.homeModules.zed
          ];

          home.stateVersion = "25.11";
        };
    };
}
