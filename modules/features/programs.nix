{
  inputs,
  ...
}:
{
  flake.nixosModules.programs =
    {
      pkgs,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        inputs.niri-float-sticky.packages.${stdenv.hostPlatform.system}.default
        inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        nemo-with-extensions
        file-roller
        ffmpegthumbnailer
        qview
        posy-cursors
        wl-clipboard
        nixd
        nixfmt
        biome
        adwaita-icon-theme
        killall
        ddcutil
        gpu-screen-recorder
        gnome-calculator
        btop
        filezilla
        gimp
        libreoffice
        pwvucontrol
        feishin
        # handbrake
        picard
        rsgain
        virt-viewer
        cifs-utils
        gparted-full
        unar
        samba
        plex-desktop
        jellyfin-mpv-shim

        # Improved which for nix
        (writeShellApplication {
          name = "nwhich";
          text = /* sh */ ''readlink -f "$(which "$1")"'';
        })

        # Copy Noctalia's settings to git files
        (writeShellApplication {
          name = "noctalia-copy";
          text = /* sh */ "noctalia config export > ~/nixos/modules/home-manager/features/noctalia/noctalia-config.toml";
        })
        # Line-in loopback
        (writeShellApplication {
          name = "line-loop";
          text = /* sh */ "pw-loopback --capture alsa_input.pci-0000_0d_00.4.analog-stereo";
        })
      ];
    };
}
