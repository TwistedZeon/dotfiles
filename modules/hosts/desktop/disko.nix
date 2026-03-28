{ self, inputs, ... }: {
  flake.diskoConfigurations.NixOSParts = {
    disko.devices = {
      disk = {
        main = {
          type = "disk";
          device = "/dev/disk/by-id/nvme-XPG_GAMMIX_S70_BLADE_2N3729ABE8EA";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                priority = 1;
                name = "ESP";
                start = "1M";
                end = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                };
              };
              plainSwap = {
                size = "16G";
                conent = {
                  type = "swap";
                  discardPolicy = "both";
                  resumeDevice = false;
              root = {
                size = "100%";
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ]; # Override existing partition
                  # Subvolumes must set a mountpoint in order to be mounted,
                  # unless their parent is mounted
                  subvolumes = {
                    # Subvolume name is different from mountpoint
                    "/rootfs" = {
                      mountpoint = "/";
                    };
                    # Subvolume name is the same as the mountpoint
                    "/home" = {
                      mountOptions = [ "compress=zstd" ];
                      mountpoint = "/home";
                    };
                    # Parent is not mounted so the mountpoint must be set
                    "/nix" = {
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                      mountpoint = "/nix";
                    };
                  };
                    };
                  };
                };
              };
            };
          };
        };
      };
}
