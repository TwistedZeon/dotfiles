{ inputs, self, ... }: {
   flake.homeModules.autostart = { pkgs, ... }: {
     programs.home-manager.enable = true;
       xdg.configFile."autostart/vesktop.desktop".text = ''
         [Desktop Entry]
         Type=Application
         Name=Vesktop
         Exec=${pkgs.vesktop}/bin/vesktop
         X-GNOME-Autostart-enabled=true
       '';
       xdg.configFile."autostart/thunderbird.desktop".text = ''
         [Desktop Entry]
         Type=Application
         Name=Thunderbird
         Exec=${pkgs.thunderbird}/bin/thunderbird
         X-GNOME-Autostart-enabled=true
       '';
       xdg.configFile."autostart/steam.desktop".text = ''
         [Desktop Entry]
         Type=Application
         Name=Steam
         Exec=${pkgs.steam}/bin/steam
         X-GNOME-Autostart-enabled=true
       '';
     };
}
