{
  ...
}:
{
  flake.nixosModules.gaming =
    {
      pkgs,
      lib,
      ...
    }:
    {
      hardware.graphics.enable = lib.mkDefault true;

      programs = {
        gamemode.enable = true;
        gamescope.enable = true;
        gamescope.capSysNice = false;
        steam = {
          enable = true;
          extraCompatPackages = with pkgs; [
            proton-ge-bin
          ];
          extraPackages = with pkgs; [
            SDL2
            # er-patcher
          ];
          protontricks.enable = true;
        };
      };

      environment.systemPackages = with pkgs; [
        faugus-launcher
        protonplus
        steam-run
        dxvk
        gamescope
        goverlay
        # r2modman
        heroic
        # er-patcher
        # steamtinkerlaunch
        prismlauncher
        ryubing
      ];
      nixpkgs.overlays = [
        # Removes fast math which can cause inaccuracies and blurry output
        (_: prev: {
          gamescope = prev.gamescope.overrideAttrs (_: {
            # https://github.com/ValveSoftware/gamescope/issues/1924#issuecomment-3725667842
            NIX_CFLAGS_COMPILE = [ "-fno-fast-math" ];
          });
        })
      ];
    };
}
