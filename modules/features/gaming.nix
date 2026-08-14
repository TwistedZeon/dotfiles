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
          extraCompatPackages = with pkgs; [
            inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.proton-ge-bin
          ];
          package = pkgs.steam.override {
            extraProfile = ''
              export DXVK_HUD=0
              export MANGOHUD=1
            '';
          };
          extraPackages = with pkgs; [
            SDL2
          ];
          protontricks.enable = true;
        };
      };

      environment.systemPackages = with pkgs; [
        inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.faugus-launcher
        inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.udpfsd
        inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.ps3netsrv
        steam-run
        dxvk
        gamescope
        goverlay
        heroic
        prismlauncher
        openttd
        ryubing
        pcsx2
        ppsspp
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
          # Use older ffmpeg until it's fixed
          pcsx2 = prev.pcsx2.override {
            ffmpeg = prev.ffmpeg_8;
          };
        })
      ];
    };
}
