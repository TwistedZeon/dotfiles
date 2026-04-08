{
  ...
}:
{
  flake.homeModules.mangohud = {
    programs.home-manager.enable = true;
    programs.mangohud = {
      enable = true;
      enableSessionWide = true;
      settings = {
        full = true;
        no_display = true;
        fps_limit = "141";
      };
    };
  };
}
