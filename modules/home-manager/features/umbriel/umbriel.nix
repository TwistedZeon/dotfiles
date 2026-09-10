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
            "Mod+Return" = "spawn:kitty";
            "Mod+Q" = "window-close";
            "Mod" = "spawn:noctalia msg panel-toggle launcher";
          };
        };
      };
    };
}
