{
  ...
}:
{
  flake.homeModules.clipboard = {
    services.cliphist = {
      enable = true;

      systemdTargets = [ "graphical-session.target" ];

      extraOptions = [
        "-max-items"
        "500"
      ];
      allowImages = true;
    };
  };
}
