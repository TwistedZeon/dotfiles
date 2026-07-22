{
  ...
}:
{

  flake.nixosModules.desktopHardware =
    {
      config,
      lib,
      modulesPath,
      ...
    }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [
        "kvm-amd"
        "hid-playstation"
      ];
      boot.kernelParams = [
        # Limit ZFS dirty data to 512MB (prevents massive I/O spikes)
        "zfs.zfs_dirty_data_max=536870912"

        # Start flushing to disk sooner (at 64MB) to keep I/O consistent
        "zfs.zfs_dirty_data_sync_percent=10"
      ];
      boot.extraModulePackages = [ ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };

}
