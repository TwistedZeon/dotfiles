{
  ...
}:
{
  flake.nixosModules.drives =
    {
      ...
    }:
    {
      fileSystems."/mnt/4TB" = {
        device = "/dev/disk/by-uuid/0c939a97-5ec5-4823-affd-a7968d252c92";
        fsType = "btrfs";
        options = [
          # If you don't have this options attribute, it'll default to "defaults"
          # boot options for fstab. Search up fstab mount options you can use
          "users" # Allows any user to mount and unmount
          "nofail" # Prevent system from failing if this drive doesn't mount
          "x-gvfs-show"
        ];
      };
      fileSystems."/mnt/Linux-Extra" = {
        device = "/dev/disk/by-uuid/47e9db01-f966-4fc1-a44d-9a3e737483eb";
        fsType = "btrfs";
        options = [
          # If you don't have this options attribute, it'll default to "defaults"
          # boot options for fstab. Search up fstab mount options you can use
          "users" # Allows any user to mount and unmount
          "nofail" # Prevent system from failing if this drive doesn't mount
          "x-gvfs-show"
        ];
      };
      fileSystems."/mnt/Massive-HDD" = {
        device = "/dev/disk/by-uuid/537870f1-e0f6-439a-b604-8225669127c0";
        fsType = "btrfs";
        options = [
          # If you don't have this options attribute, it'll default to "defaults"
          # boot options for fstab. Search up fstab mount options you can use
          "users" # Allows any user to mount and unmount
          "nofail" # Prevent system from failing if this drive doesn't mount
          "x-gvfs-show"
        ];
      };
    };
}
