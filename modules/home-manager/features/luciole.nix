{
  ...
}:
{
  flake.homeModules.luciole = { pkgs, ... }: {
    programs.luciole.enable = true;

    home.packages = [
      pkgs.papirus-icon-theme
    ];
  };
}
