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
    };
}
