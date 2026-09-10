{
  ...
}:
{
  flake.nixosModules.overlays =
    {
      ...
    }:
    {
      nixpkgs.overlays = [
        # Removes fast math which can cause inaccuracies and blurry output
        (_: prev: {
          gamescope = prev.gamescope.overrideAttrs (_: {
            # https://github.com/ValveSoftware/gamescope/issues/1924#issuecomment-3725667842
            NIX_CFLAGS_COMPILE = [ "-fno-fast-math" ];
          });
        })
      ];
    };
}
