{
  ...
}:
{
  perSystem =
    {
      pkgs,
      ...
    }:
    {
      packages.faugus-launcher = pkgs.callPackage ../../pkgs/faugus-launcher.nix { };
      packages.udpfsd = pkgs.callPackage ../../pkgs/udpfsd.nix { };
    };
}
