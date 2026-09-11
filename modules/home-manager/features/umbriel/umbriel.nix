{
  ...
}:
{
  flake.homeModules.umbriel =
    {
      ...
    }:
    {
      programs.umbriel = {
        enable = true;
        settings = {
          general = {
            autostart = [ "noctalia" ];
            show_cheatsheet = false;
          };

          # Layout & Apperance
          layout.gap = 0;
          appearance = {
            border_width = 1;
            outer_border_width = 0;
            corner_radius = 0;
            blur = {
              enabled = true;
              optimized = true;
              passes = 3;
              radius = 3;
              noise = 0.02;
              saturation = 1.5;
            };
          };
          colors = {
            background = "#181211FF";
            text_primary = "#FFFFFFFF";
            text_muted = "#B0A5A2FF";

            accent_primary = "#DB4343FF";
            accent_secondary = "#DEB764FF";

            warning = "#DEB764FF";
            error = "#9B0000FF";

            insert_hint = "#DB434380";
            backdrop = "#181211FF";
            shadow = "#000000A0";

            border = {
              focused = "#DB4343FF";
              unfocused = "#505050FF";
              outer = "#181211FF";
            };

            overview = {
              background_tint = "#181211B0";
              workspace_background = "#181211DD";
              badge = "#DB4343FF";
            };
          };

          # Keyboard & Mouse
          input.keyboard.layout = "us";
          input.mouse = {
            accel_profile = "flat";
          };
          input.cursor = {
            theme = "Posy_Cursor";
          };

          # Outputs
          output.DP-1 = {
               mode = "1920x1080@143.980";
               position = [ 0 0 ];
               scale = 1.0;
               workspaces = "dynamic";
             };
          output.HDMI-A-1 = {
             mode = "1440x900@74.984";
             position = [ 1920 50 ];
             scale = 1.0;
           };

          workspace = [
            {
              name = "Chat";
              output = "DP-1";
            }
            {
              name = "Gaming";
              output = "DP-1";
            }
            {
              name = "Main";
              output = "DP-1";
            }
           ];

          keybinds = {
            "Mod+Return" = "spawn:ghostty";
            "Mod+E" = "spawn:nemo";
            "Mod+O" = "overview-toggle";
            "Mod+Q" = "window-close";
            "Mod+S" = "spawn:noctalia msg panel-toggle launcher";
            "Mod+Ctrl+V" = "spawn:noctalia msg panel-toggle clipboard";
            "Mod+Shift+S" = "spawn:noctalia msg screenshot-region";
            "Mod+Ctrl+S" = "spawn:noctalia msg screenshot-fullscreen";
            "Mod+Shift+Q" = "spawn:noctalia msg panel-toggle session";

            # Media Keys
            "XF86AudioRaiseVolume" = "spawn:noctalia msg volume-up";
            "XF86AudioLowerVolume" = "spawn:noctalia msg volume-down";
            "XF86AudioMute" = "spawn:noctalia msg volume-mute";
            "XF86AudioMicMute" = "spawn:noctalia msg mic-mute";
            "XF86AudioNext" = "spawn:noctalia msg media next";
            "XF86AudioPrev" = "spawn:noctalia msg media previous";
            "XF86AudioPlay" = "spawn:noctalia msg media toggle";
            "XF86AudioPause" = "spawn:noctalia msg media toggle";

            # Workspace Switching
            "Mod+Left" = "column-move-left";
            "Mod+Right" = "column-move-right";

            "Mod+WheelDown" = "workspace-next";
            "Mod+WheelUp" = "workspace-previous";
            "Mod+Ctrl+WheelDown" = "column-move-to-workspace-next";
            "Mod+Ctrl+WheelUp" = "column-move-to-workspace-previous";
            "Mod+Shift+WheelDown" = "window-focus-right";
            "Mod+Shift+WheelUp" = "window-focus-left";
            "Mod+Ctrl+Shift+WheelDown" = "column-move-right";
            "Mod+Ctrl+Shift+WheelUp" = "column-move-left";

            "Mod+1" = "workspace-switch:1";
            "Mod+2" = "workspace-switch:2";
            "Mod+3" = "workspace-switch:3";
            "Mod+4" = "workspace-switch:4";
            "Mod+5" = "workspace-switch:5";
            "Mod+6" = "workspace-switch:6";
            "Mod+7" = "workspace-switch:7";
            "Mod+8" = "workspace-switch:8";
            "Mod+9" = "workspace-switch:9";

            "Mod+CTRL+1" = "window-move-to-workspace:1";
            "Mod+CTRL+2" = "window-move-to-workspace:2";
            "Mod+CTRL+3" = "window-move-to-workspace:3";
            "Mod+CTRL+4" = "window-move-to-workspace:4";
            "Mod+CTRL+5" = "window-move-to-workspace:5";
            "Mod+CTRL+6" = "window-move-to-workspace:6";
            "Mod+CTRL+7" = "window-move-to-workspace:7";
            "Mod+CTRL+8" = "window-move-to-workspace:8";
            "Mod+CTRL+9" = "window-move-to-workspace:9";

            # Layout Controls
            "Mod+Ctrl+F" = "window-toggle-maximize";
            "Mod+C" = "column-center";
            "Mod+Minus" = "window-modify-width:-0.1";
            "Mod+Equal" = "window-modify-width:0.1";
            "Mod+Shift+Minus" = "window-modify-height:-0.1";
            "Mod+Shift+Equal" = "window-modify-height:0.1";

            # Modes
            "Mod+T" = "window-toggle-floating";
            "Mod+F" = "window-toggle-fullscreen";
          };

          # Layer Rules
          layer_rule = [
            {
              match.namespace = ''^noctalia-(bar-[^"]+|notification|dock|panel|attached-panel|osd|desktop-widget-[^"]*)$'';
              blur = true;
              blur_ignore_alpha = 0.5;
              blur_popups = true;
            }
          ];

          # Window Rules
          window_rule = [
            {
              match.app_id = "^com.mitchellh.ghostty$";
              blur = true;
              blur_optimized = true;
            }
          ];
        };
      };
    };
}
