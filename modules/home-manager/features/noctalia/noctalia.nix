{
  ...
}:
{
  flake.homeModules.noctalia =
    {
      ...
    }:
    {
      programs.noctalia = {
        enable = true;

        settings = ./noctalia-config.toml;
      };
      home.file.".config/noctalia/palettes/MyPalette.json".source = ./zeon-palette.json;
    };
}
