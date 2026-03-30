{ self, inputs, ... }: {
  flake.nixosModules.gnome = { pkgs, ... }: {
    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
    
    # dconf
    programs.dconf.profiles.user.databases = [
      {
        lockAll = true; #prevents overriding
        settings = {
          "org/gnome/desktop/interface" = {
            accent-color = "red";
          };
        };
      }
    ];
  };
}
