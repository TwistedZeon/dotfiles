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
          general.autostart = [ "noctalia" ];
          layout.gap = 0;
          input.keyboard.layout = "us";
          input.mouse = {
            accel_profile = "flat";
          };
          input.cursor = {
            theme = "Posy_Cursor";
          };
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
            "Mod+Q" = "window-close";
            "Mod+S" = "spawn:noctalia msg panel-toggle launcher";
            "Mod+Ctrl+V" = "spawn:noctalia msg panel-toggle clipboard";
            "Mod+Shift+S" = "spawn:noctalia msg screenshot-region";
            "Mod+Ctrl+S" = "spawn:noctalia msg screenshot-fullscreen";
            "Mod+Shift+Q" = "spawn:noctalia msg panel-toggle session";
            "Mod+E" = "spawn:nemo";
            "XF86AudioRaiseVolume" = "spawn:noctalia msg volume-up";
            "XF86AudioLowerVolume" = "spawn:noctalia msg volume-down";
            "XF86AudioMute" = "spawn:noctalia msg volume-mute";
            "XF86AudioMicMute" = "spawn:noctalia msg mic-mute";
            "XF86AudioNext" = "spawn:noctalia msg media next";
            "XF86AudioPrev" = "spawn:noctalia msg media previous";
            "XF86AudioPlay" = "spawn:noctalia msg media toggle";
            "XF86AudioPause" = "spawn:noctalia msg media toggle";
            "Mod+Left" = "column-move-left";
            "Mod+Right" = "column-move-right";

          };
        };
      };
    };
}
