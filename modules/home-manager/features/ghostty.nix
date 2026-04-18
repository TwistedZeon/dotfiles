{
  ...
}:
{
  flake.homeModules.ghostty =
    {
      pkgs,
      lib,
      ...
    }:
    {
      programs.home-manager.enable = true;
      programs.ghostty = {
        enable = true;
        package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;

        # Enable for whichever shell you plan to use!
        enableFishIntegration = true;

        settings = {
          theme = "Adwaita Dark";
          font-family = "JetBrainsMono Nerd Font";
          background-opacity = "0.80";
          gtk-titlebar = false;
          window-decoration = "none";
          window-padding-x = 5;
          window-padding-y = 5;
          command = "SHELL=${lib.getExe pkgs.fish} fish";
          # maximize = true;
        };
      };
    };
}
