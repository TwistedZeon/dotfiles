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

        iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.papirus-icon-theme;
        };

        gtk3.extraConfig = {
          gtk-application-prefer-dark-theme = true;
        };

        gtk4.extraConfig = {
          gtk-application-prefer-dark-theme = true;
        };

        gtk4.theme = null;
      };
      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };
      home.file = {
        ".config/gtk-3.0/gtk.css".text = ''
          @define-color accent_color #DB4343;
          @define-color theme_selected_bg_color #DB4343;
          @define-color theme_selected_fg_color #FFFFFF;

          /* Nemo file selection */
          .view:selected,
          .view:selected:focus {
            background-color: #DB4343;
            color: #FFFFFF;
          }
        '';

        ".config/gtk-4.0/gtk.css".text = ''
          window,
          window.background,
          .background {
            border-radius: 0;
          }

          /* GTK 4 accent colour */
          @define-color accent_color #DB4343;
        '';
      };
    };
}
