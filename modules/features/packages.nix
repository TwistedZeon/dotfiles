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
      packages.ps3netsrv = pkgs.callPackage ../../pkgs/ps3netsrv.nix { };
    };
}
