{
  ...
}:
{
  flake.homeModules.dconf =
    {
      pkgs,
      lib,
      ...
    }:
    {
      dconf.settings = {
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
        # Time Format - File chooser
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
        # Enable Extensions
        "org/gnome/shell" = {
          enabled-extensions = [
            pkgs.gnomeExtensions.auto-move-windows.extensionUuid
            pkgs.gnomeExtensions.appindicator.extensionUuid
            pkgs.gnomeExtensions.clipboard-indicator.extensionUuid
            pkgs.gnomeExtensions.quick-settings-audio-panel.extensionUuid
            pkgs.gnomeExtensions.in-picture.extensionUuid
          ];
        };
        "org/gnome/shell/extensions/auto-move-windows" = {
          application-list = [
            "steam.desktop:2"
            "faugus-launcher.desktop:2"
            "vesktop.desktop:1"
            "mumble.desktop:1"
            "thunderbird.desktop:1"
          ];
        };
        "org/gnome/shell/extensions/in-picture" = {
          corner = 1;
          diagonal-relative = 30;
          margin-y = 40;
          stick = true;
          identifiers = [
            [
              "Picture-in-Picture"
              ""
            ]
            [
              "Picture in picture"
              ""
            ]
            [
              "TelegramDesktop"
              ""
            ]
          ];
        };
        "org/gnome/nautilus/window-state" = {
          maximized = true;
        };
        "org/gnome/nautilus/preferences" = {
          default-folder-viewer = "icon-view";
        };
        "org/gtk/gtk4/settings/file-chooser" = {
          show-hidden = true;
        };
        "org/gnome/nautilus/list-view" = {
          default-zoom-level = "small";
          default-column-order = [
            "name"
            "size"
            "type"
            "date_modified"
          ];
          default-visible-columns = [
            "name"
            "size"
            "type"
            "data_modified"
          ];
        };
      };
    };
}
