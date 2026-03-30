{ self, inputs, ... }: {
  
  flake.nixosModules.desktopHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports =[ 
      (modulesPath + "/profiles/qemu-guest.nix")
    ];

    boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/cache" =
      { device = "zroot/cache";
        fsType = "zfs";
        neededForBoot = true;
      };

    fileSystems."/persist" =
      { device = "zroot/persist";
        fsType = "zfs";
        neededForBoot = true;
      };

    fileSystems."/tmp" =
      { device = "zroot/tmp";
        fsType = "zfs";
      };

    fileSystems."/nix" =
      { device = "zroot/nix";
        fsType = "zfs";
      };

    fileSystems."/" =
      { device = "zroot/root";
        fsType = "zfs";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-label/NIXBOOT";
        fsType = "vfat";
      };

    swapDevices =
      [ { device = "/dev/disk/by-label/SWAP"; }
      ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
  
}
