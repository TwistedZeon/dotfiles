{
  inputs,
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
          remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
          dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server hosting
          # extraCompatPackages = with pkgs; [
          #   proton-ge-bin
          # ];
          extraPackages = with pkgs; [
            SDL2
          ];
          protontricks.enable = true;
        };
      };

      environment.systemPackages = with pkgs; [
        inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.faugus-launcher
        inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.udpfsd
        steam-run
        dxvk
        gamescope
        goverlay
        heroic
        prismlauncher
        openttd
        ryubing
        pcsx2
        dolphin-emu
        tochd
        r2modman
        scummvm
        wineWow64Packages.staging
        winetricks
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
