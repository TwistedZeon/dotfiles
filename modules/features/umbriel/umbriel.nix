
{
  inputs,
  ...
}:
{
  flake.nixosModules.umbriel =
    {
      pkgs,
      ...
    }:
    {
      imports = [ inputs.umbriel.nixosModules.default ];

      programs.umbriel.enable = true;

      xdg.portal = {
        extraPortals = [
          inputs.luciole.packages.${pkgs.stdenv.hostPlatform.system}.default
          pkgs.xdg-desktop-portal-gtk
        ];

        config.umbriel."org.freedesktop.impl.portal.FileChooser" = [
          "luciole"
          "gtk"
        ];
      };
    };
}
