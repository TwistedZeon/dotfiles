{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.niri =
    {
      pkgs,
      ...
    }:
    {
      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
      };
      environment.systemPackages = with pkgs; [
        quickshell
        nemo-with-extensions
        file-roller
        yazi
        qview
        posy-cursors
        grim
        slurp
        swappy
        wl-clipboard
        nixd
        nixfmt
        biome
      ];
      nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      environment.variables = {
        QT_QPA_PLATFORMTHEME = "gtk3";
      };
      security.polkit.enable = true;
      # User's credentials manager
      services.gnome.gnome-keyring.enable = true;
      xdg.portal = {
        enable = true;
        wlr.enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-wlr
          xdg-desktop-portal-gnome
        ];
      };
      environment.etc."xdg-desktop-portal/niri-portal.conf".text = ''
        	[preferred]
        	default=gtk
        	org.freedesktop.impl.portal.FileChooser=gtk
        	org.freedesktop.impl.portal.AppChooser=gtk
        	org.freedesktop.impl.portal.Print=gtk
        	org.freedesktop.impl.portal.Notification=gtk
        	org.freedesktop.impl.portal.Inhibit=gtk
        	org.freedesktop.impl.portal.Access=gtk
        	org.freedesktop.impl.portal.Account=gtk
        	org.freedesktop.impl.portal.Email=gtk
        	org.freedesktop.impl.portal.DynamicLauncher=gtk
        	org.freedesktop.impl.portal.RemoteDesktop=wlr
        	org.freedesktop.impl.portal.ScreenCast=wlr
        	org.freedesktop.impl.portal.ScreenShot=wlr
      '';
    };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;
        settings = {
          outputs = {
            "DP-1" = {
              mode = "1920x1080@143.980";
              scale = 1;
              transform = "normal";
              position = _: {
                props = {
                  x = 0;
                  y = 0;
                };
              };
              variable-refresh-rate = _: {
                props.on-demand = true;
              };
            };
            "HDMI-A-1" = {
              mode = "1440x900@74.984";
              scale = 1;
              transform = "normal";
              position = _: {
                props = {
                  x = 1920;
                  y = 50;
                };
              };
            };
            hot-corners = {
              off = _: { };
            };
          };

          input = {
            mouse = {
              # Disable acceleration
              accel-profile = "flat";

              # Faster scrolling with the mouse wheel.
              scroll-factor = 2.0;
            };
            keyboard = {
              numlock = _: { };
            };
            focus-follows-mouse = _: {
              # Automatically focus windows under the mouse pointer
              props.max-scroll-amount = "0%";
            };
            workspace-auto-back-and-forth = _: { }; # Enable workspace back & forth switching
          };

          cursor = {
            xcursor-theme = "Posy_Cursor";
          };

          spawn-at-startup = [
            (lib.getExe self'.packages.noctalia-shell)
            (lib.getExe pkgs.thunderbird)
          ];

          spawn-sh-at-startup = [
            "sleep 10s && ${lib.getExe pkgs.vesktop}"
            "sleep 2s && steam"
          ];

          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

          input.keyboard = {
            xkb.layout = "us";
          };

          layout = {
            focus-ring = {
              width = 4;
              active-color = "#c26554";
              inactive-color = "#505050";
              urgent-color = "#9b0000";
              # active-gradient from="#80c8ff" to="#bbddff" angle=45
              # inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
              # urgent-gradient from="#800" to="#a33" angle=45
            };
          };

          layout.gaps = 5;

          hotkey-overlay = {
            # Avoid auto-showing the important hotkeys menu.
            skip-at-startup = _: { };
          };

          screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d %H-%M-%S.png";

          binds = {
            "Mod+Return".spawn-sh = "${lib.getExe pkgs.ghostty}";
            "Mod+Q".close-window = _: { };
            "Mod+S".spawn-sh = "${lib.getExe self'.packages.noctalia-shell} ipc call launcher toggle";
            "Mod+Ctrl+V".spawn-sh = "${lib.getExe self'.packages.noctalia-shell} ipc call launcher clipboard";
            "Mod+Shift+S".spawn-sh = ''
              FILE=~/Pictures/Screenshots/$(date +"%Y-%m-%d %H-%M-%S").png
              ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.swappy}/bin/swappy -f - -o "$FILE"
            '';
            #"Mod+Shift+S".screenshot-window = _: { };
            "Mod+Ctrl+S".screenshot-screen = _: { };
            "Mod+Shift+Slash".show-hotkey-overlay = _: { };
            "Mod+Shift+Q".spawn-sh = "${lib.getExe self'.packages.noctalia-shell} ipc call sessionMenu toggle";
            "Mod+E".spawn = "${lib.getExe pkgs.nemo}";
            # Media Controls
            "XF86AudioRaiseVolume" = _: {
              props.allow-when-locked = true;
              content.spawn-sh = "${lib.getExe self'.packages.noctalia-shell} ipc call volume increase";
            };
            "XF86AudioLowerVolume" = _: {
              props.allow-when-locked = true;
              content.spawn-sh = "${lib.getExe self'.packages.noctalia-shell} ipc call volume decrease";
            };
            "XF86AudioMute" = _: {
              props.allow-when-locked = true;
              content.spawn-sh = "${lib.getExe self'.packages.noctalia-shell} ipc call volume muteOutput";
            };
            "XF86AudioMicMute" = _: {
              props.allow-when-locked = true;
              content.spawn-sh = "${lib.getExe self'.packages.noctalia-shell} ipc call volume muteInput";
            };
            "XF86AudioNext" = _: {
              props.allow-when-locked = true;
              content.spawn-sh = "${lib.getExe self'.packages.noctalia-shell} ipc call media next";
            };
            "XF86AudioPrev" = _: {
              props.allow-when-locked = true;
              content.spawn-sh = "${lib.getExe self'.packages.noctalia-shell} ipc call media previous";
            };
            "XF86AudioPlay" = _: {
              props.allow-when-locked = true;
              content.spawn-sh = "${lib.getExe self'.packages.noctalia-shell} ipc call media playPause";
            };
            "XF86AudioPause" = _: {
              props.allow-when-locked = true;
              content.spawn-sh = "${lib.getExe self'.packages.noctalia-shell} ipc call media playPause";
            };
            # Window Movement and Focus
            "Mod+Left".focus-column-left = _: { };
            "Mod+H".focus-column-left = _: { };
            "Mod+Right".focus-column-right = _: { };
            "Mod+L".focus-column-right = _: { };
            "Mod+Up".focus-window-up = _: { };
            "Mod+K".focus-window-up = _: { };
            "Mod+Down".focus-window-down = _: { };
            "Mod+J".focus-window-down = _: { };

            "Mod+CTRL+Left".move-column-left = _: { };
            "Mod+CTRL+H".move-column-left = _: { };
            "Mod+CTRL+Right".move-column-right = _: { };
            "Mod+CTRL+L".move-column-right = _: { };
            "Mod+CTRL+UP".move-window-up = _: { };
            "Mod+CTRL+K".move-window-up = _: { };
            "Mod+CTRL+Down".move-window-down = _: { };
            "Mod+CTRL+J".move-window-down = _: { };

            "Mod+Home".focus-column-first = _: { };
            "Mod+End".focus-column-last = _: { };
            "Mod+CTRL+Home".move-column-to-first = _: { };
            "Mod+CTRL+End".move-column-to-last = _: { };

            "Mod+Shift+Left".focus-monitor-left = _: { };
            "Mod+Shift+Right".focus-monitor-right = _: { };
            "Mod+Shift+UP".focus-monitor-up = _: { };
            "Mod+Shift+Down".focus-monitor-down = _: { };

            "Mod+Shift+CTRL+Left".move-column-to-monitor-left = _: { };
            "Mod+Shift+CTRL+Right".move-column-to-monitor-right = _: { };
            "Mod+Shift+CTRL+UP".move-column-to-monitor-up = _: { };
            "Mod+Shift+CTRL+Down".move-column-to-monitor-down = _: { };
            # Workspace Switching
            "Mod+WheelScrollDown" = _: {
              props.cooldown-ms = 150;
              content.focus-workspace-down = _: { };
            };
            "Mod+WheelScrollUp" = _: {
              props.cooldown-ms = 150;
              content.focus-workspace-up = _: { };
            };
            "Mod+CTRL+WheelScrollDown" = _: {
              props.cooldown-ms = 150;
              content.move-column-to-workspace-down = _: { };
            };
            "Mod+CTRL+WheelScrollUp" = _: {
              props.cooldown-ms = 150;
              content.move-column-to-workspace-up = _: { };
            };

            "Mod+WheelScrollRight".focus-column-right = _: { };
            "Mod+WheelScrollLeft".focus-column-left = _: { };
            "Mod+CTRL+WheelScrollRight".move-column-right = _: { };
            "Mod+CTRL+WheelScrollLeft".move-column-left = _: { };

            "Mod+Shift+WheelScrollDown".focus-column-right = _: { };
            "Mod+Shift+WheelScrollUp".focus-column-left = _: { };
            "Mod+CTRL+Shift+WheelScrollDown".move-column-right = _: { };
            "Mod+CTRL+Shift+WheelScrollUp".move-column-left = _: { };

            "Mod+1".focus-workspace = 1;
            "Mod+2".focus-workspace = 2;
            "Mod+3".focus-workspace = 3;
            "Mod+4".focus-workspace = 4;
            "Mod+5".focus-workspace = 5;
            "Mod+6".focus-workspace = 6;
            "Mod+7".focus-workspace = 7;
            "Mod+8".focus-workspace = 8;
            "Mod+9".focus-workspace = 9;

            "Mod+CTRL+1".move-column-to-workspace = 1;
            "Mod+CTRL+2".move-column-to-workspace = 2;
            "Mod+CTRL+3".move-column-to-workspace = 3;
            "Mod+CTRL+4".move-column-to-workspace = 4;
            "Mod+CTRL+5".move-column-to-workspace = 5;
            "Mod+CTRL+6".move-column-to-workspace = 6;
            "Mod+CTRL+7".move-column-to-workspace = 7;
            "Mod+CTRL+8".move-column-to-workspace = 8;
            "Mod+CTRL+9".move-column-to-workspace = 9;

            "Mod+TAB".focus-workspace-previous = _: { };
            # Layout Controls
            "Mod+CTRL+F".expand-column-to-available-width = _: { };
            "Mod+C".center-column = _: { };
            "Mod+CTRL+C".center-visible-columns = _: { };
            "Mod+Minus".set-column-width = "-10%";
            "Mod+Equal".set-column-width = "+10%";
            "Mod+Shift+Minus".set-window-height = "-10%";
            "Mod+Shift+Equal".set-window-height = "+10%";
            # Modes
            "Mod+T".toggle-window-floating = _: { };
            "Mod+F".fullscreen-window = _: { };
            "Mod+W".toggle-column-tabbed-display = _: { };
            # Emergency Escape Key
            # Use this when a fullscreen app blocks your keybinds.
            # It disables any active keyboard shortcut inhibitor, restoring control.
            "Mod+ESCAPE" = _: {
              props.allow-inhibiting = false;
              content.toggle-keyboard-shortcuts-inhibit = _: { };
            };
            # Exit / Power
            "CTRL+ALT+Delete".quit = _: { }; # Also quits Niri
            "Mod+O" = _: {
              props.repeat = false;
              content.toggle-overview = _: { };
            };
          };

          workspaces = {
            "Chat" = {
              open-on-output = "DP-1";
            };
            "Gaming" = {
              open-on-output = "DP-1";
            };
            "Main" = {
              open-on-output = "DP-1";
            };
          };
          window-rules = [
            {
              matches = [ { app-id = "steam"; } ];
              open-maximized-to-edges = true;
              open-on-workspace = "Gaming";
            }
            {
              matches = [ { app-id = "vesktop"; } ];
              open-maximized-to-edges = true;
              open-on-workspace = "Chat";
              block-out-from = "screencast";
            }
            {
              matches = [ { app-id = "mumble"; } ];
              open-maximized-to-edges = true;
              open-on-workspace = "Chat";
              block-out-from = "screencast";
            }
            {
              matches = [ { app-id = "thunderbird"; } ];
              open-maximized-to-edges = true;
              open-on-workspace = "Chat";
              block-out-from = "screencast";
            }
            {
              matches = [ { app-id = "zen"; } ];
              open-maximized-to-edges = true;
              block-out-from = "screencast";
            }
            {
              matches = [ { app-id = "faugus-launcher"; } ];
              open-maximized-to-edges = true;
              open-on-workspace = "Gaming";
            }
            {
              matches = [ { app-id = "com.interversehq.qView"; } ];
              open-maximized-to-edges = true;
              block-out-from = "screencast";
            }
            {
              geometry-corner-radius = 10;
              clip-to-geometry = true;
            }
          ];
        };
      };
    };
}
