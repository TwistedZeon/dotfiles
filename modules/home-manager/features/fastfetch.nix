{
  ...
}:
{
  flake.homeModules.fastfetch = {
    programs.home-manager.enable = true;
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          type = "none";
          # source = "nixos";
          # height = 20;
          # padding = {
          # right = 1;
        };
        display = {
          size = {
            binaryPrefix = "si";
          };
          color = "red";
          separator = ": ";
        };
        modules = [
          "title"
          "separator"
          "os"
          "host"
          "kernel"
          "uptime"
          "packages"
          "shell"
          "display"
          "wm"
          "theme"
          "icons"
          "font"
          "cursor"
          "terminal"
          "cpu"
          "gpu"
          "memory"
          "swap"
          "disk"
          "break"
          "colors"
        ];
      };
    };
  };
}
