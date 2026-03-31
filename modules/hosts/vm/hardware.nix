{ self, inputs, ... }: {
  
  flake.nixosModules.vmHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports =[ 
      (modulesPath + "/profiles/qemu-guest.nix")
    ];

    boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];
    
    fileSystems."/" =
      { device = "/dev/disk/by-uuid/daa4a070-f6d8-4063-a709-a9097c86515c";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/56E3-D64B";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/0ac5add8-d48b-4031-ad4a-44bfe01f5231"; }
      ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
  
}
