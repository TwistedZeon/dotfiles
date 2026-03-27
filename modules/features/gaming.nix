{ self, inputs, ... }: {
  flake.nixosModules.gaming = { pkgs, lib, ... }: {
    hardware.graphics.enable = lib.mkDefault true;

    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam = {
        enable = true;
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
        extraPackages = with pkgs; [
          SDL2
          gamescope
          # er-patcher
        ];
        protontricks.enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      faugus-launcher
      # protonplus
      steam-run
      # dxvk
      gamescope
      mangohud
      # r2modman
      heroic
      # er-patcher
      # steamtinkerlaunch
      prismlauncher
    ];
  };
}
