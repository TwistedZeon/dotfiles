{
  ...
}:
{
  flake.homeModules.gtk =
    {
      pkgs,
      ...
    }:
    {
      programs.home-manager.enable = true;
      gtk = {
        enable = true;

        theme = {
          name = "Adwaita";
          package = pkgs.gnome-themes-extra;
        };

        gtk3.extraConfig = {
          gtk-application-prefer-dark-theme = false;
        };

        gtk4.extraConfig = {
          gtk-application-prefer-dark-theme = false;
        };

        gtk4.theme = null;
      };
      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-light";
        };
      };
    };
}
