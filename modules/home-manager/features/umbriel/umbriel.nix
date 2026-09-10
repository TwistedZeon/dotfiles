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
          keybinds = {
            "Mod+Return" = "spawn:ghostty";
            "Mod+Q" = "window-close";
            "Mod+S" = "spawn:noctalia msg panel-toggle launcher";
          };
        };
      };
    };
}
