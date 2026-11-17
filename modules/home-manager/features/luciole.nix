{
  ...
}:
{
  flake.homeModules.luciole = { config, ... }: {
    programs.luciole = {
      enable = true;

      settings.browser = {
        always_show_status_bar = true;
        show_hidden = true;
      };
    };

    xdg.dataFile."dbus-1/services/org.freedesktop.FileManager1.service".source =
      "${config.programs.luciole.package}/share/dbus-1/services/dev.noctalia.luciole.FileManager1.service";
  };
}
