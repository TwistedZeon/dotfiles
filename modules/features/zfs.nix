{
  ...
}:
{
  flake.nixosModules.zfs =
    {
      config,
      ...
    }:
    {
      boot = {
        supportedFilesystems.zfs = true;
        zfs = {
          forceImportRoot = false;
          devNodes =
            if config.hardware.cpu.intel.updateMicrocode then "/dev/disk/by-id" else "/dev/disk/by-partuuid";
        };
      };
      services.zfs = {
        autoScrub.enable = true;
        trim.enable = true;
      };

      networking.hostId = "f3c50b52";

      services.sanoid = {
        enable = true;

        datasets = {
          "zroot/persist" = {
            hourly = 50;
            daily = 15;
            weekly = 3;
            monthly = 1;
          };
        };
      };

      fileSystems."/cache" = {
        device = "zroot/cache";
        fsType = "zfs";
        neededForBoot = true;
      };

      fileSystems."/persist" = {
        device = "zroot/persist";
        fsType = "zfs";
        neededForBoot = true;
      };

      fileSystems."/tmp" = {
        device = "zroot/tmp";
        fsType = "zfs";
      };

      fileSystems."/nix" = {
        device = "zroot/nix";
        fsType = "zfs";
      };

      fileSystems."/" = {
        device = "zroot/root";
        fsType = "zfs";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-label/NIXBOOT";
        fsType = "vfat";
      };

      swapDevices = [
        { device = "/dev/disk/by-label/SWAP"; }
      ];
    };
}
