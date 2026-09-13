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
      programs.umbriel = {
        enable = true;
        package = inputs.umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
          # https://github.com/Supreeeme/xwayland-satellite/issues/429
          xwayland-satellite = pkgs.xwayland-satellite.overrideAttrs (old: rec {
            version = "0.8.2-unstable-2026-09-09";

            src = pkgs.fetchFromGitHub {
              owner = "Supreeeme";
              repo = "xwayland-satellite";
              rev = "f145d6a5529764355deb563f91afdc28ad7463d3";
              hash = "sha256-0ZsP4u49Ps5nSRbkrBGpNEShKyLXSrS4mNegkoBjhdQ=";
            };

            cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
              inherit src;
              hash = "sha256-s1gl9eR6Mt2QLrhfcowstPFjzwE/lz4PJhJzWYHoIHg=";
            };
          });
        };
      };
    };
}
