{ self, inputs, ... }: {
  flake.nixosModules.gnome = { pkgs, lib, ... }: {
    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
    
    # Extensions
    environment.systemPackages = [
      pkgs.gnomeExtensions.auto-move-windows
      pkgs.gnomeExtensions.appindicator
      pkgs.gnomeExtensions.clipboard-indicator
      pkgs.gnomeExtensions.quick-settings-audio-panel
    ];
    
    # dconf
    programs.dconf.profiles.user.databases = [
      {
        lockAll = true; #prevents overriding
        settings = {
          "org/gnome/mutter" = {
            experimental-features = [
              "variable-refresh-rate"
            ];
          };
          # Numlock on login
          "org/gnome/desktop/peripherals/keyboard" = {
            numlock-state = true;
            remember-numlock-state = true;
          };
          "org/gnome/desktop/interface" = {
            accent-color = "red";
          };
          # Time Format
          "org/gnome/desktop/interface" = {
            clock-format = "12h";
          };
          # Time Format
          "org/gtk/settings/file-chooser" = {
            clock-format = "12h";
          };
          # Mouse Acceleration
          "org/gnome/desktop/peripherals/mouse" = {
            accel-profile = "flat";
          };
          # Automatic Screen Blank
          "org/gnome/desktop/session" = {
            idle-delay = lib.gvariant.mkUint32 0;
          };
          # Automatic Suspend
          "org/gnome/settings-daemon/plugins/power" = {
            sleep-inactive-ac-type = "nothing";
            sleep-inactive-battery-timeout = "nothing";

            # Optional but helps consistency
            idle-dim = false;
          };
          "org/gnome/shell" = {
            enabled-extensions = [
              pkgs.gnomeExtensions.auto-move-windows.extensionUuid
              pkgs.gnomeExtensions.appindicator.extensionUuid
              pkgs.gnomeExtensions.clipboard-indicator.extensionUuid
              pkgs.gnomeExtensions.quick-settings-audio-panel.extensionUuid
            ];
          };
          "org/gnome/shell/extensions/auto-move-windows" = {
            application-list = [ 
              steam.desktop:2
              faugus-launcher.desktop:2
              vesktop.desktop:1
              mumble.desktop:1
              thunderbird.desktop:1
            ];
          };
        };
      }
    ];
  };
}
