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
          output.DP-1 = {
               mode = "1920x1080@143.980";
               position = [ 0 0 ];
               scale = 1.0;
             };
          output.HDMI-A-1 = {
             mode = "1440x900@74.984";
             position = [ 1920 50 ];
             scale = 1.0;
           };
          keybinds = {
            "Mod+Return" = "spawn:ghostty";
            "Mod+Q" = "window-close";
            "Mod+S" = "spawn:noctalia msg panel-toggle launcher";
          };
        };
      };
    };
}
