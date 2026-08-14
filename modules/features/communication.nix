{
  ...
}:
{
  flake.nixosModules.communication =
    {
      pkgs,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        arrpc
        mumble
        thunderbird
        element-desktop
      ];
      systemd.packages = with pkgs; [
        arrpc
     ];
    };
}
