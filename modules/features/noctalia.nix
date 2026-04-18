{
  inputs,
  ...
}:
{
  perSystem =
    {
      pkgs,
      ...
    }:
    {
      packages.noctalia-shell = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        settings = (builtins.fromJSON (builtins.readFile ./noctalia.json)).settings;
        colors = {
          mError = "#ffb4ab";
          mHover = "#DB4343";
          mOnError = "#690005";
          mOnHover = "#FFFFFF";
          mOnPrimary = "#FFFFFF";
          mOnSecondary = "#442925";
          mOnSurface = "#FFFFFF";
          mOnSurfaceVariant = "#FFFFFF";
          mOnTertiary = "#3e2e04";
          mOutline = "#534341";
          mPrimary = "#DB4343";
          mSecondary = "#e7bdb6";
          mTertiary = "#deb764";
          mShadow = "#000000";
          mSurface = "#181211";
          mSurfaceVariant = "#251e1d";
          foreground = "#EDE0DD";
          background = "#181211";
          selectionFg = "#5F150D";
          selectionBg = "#DB4343";
          cursor = "#DB4343";
          cursorText = "#5F150D";
        };
      };
    };
}
