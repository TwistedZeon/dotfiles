{
  inputs,
  self,
  ...
}:
{
  flake.nixosModules.homeManager =
    {
      ...
    }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      home-manager.backupFileExtension = "backup";

      home-manager.useGlobalPkgs = true;

      home-manager.users.zeon =
        {
          ...
        }:
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
            self.homeModules.gtk
            self.homeModules.firefox
          ];

          home.stateVersion = "25.11";
        };
    };
}
