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
          # source = "nixos_old";
          # padding = {
          #   right = 1;
          # };
        };
        display = {
          size = {
            binaryPrefix = "si";
          };
          color = "#DB4343";
          separator = ": ";
        };
        modules = [
          "title"
          {
            type = "custom";
            format = "───────────────────────";
          }
          {
            type = "os";
            key = " OS";
          }
          {
            type = "kernel";
            key = "󰍛 Kernel";
          }
          {
            type = "uptime";
            key = " Uptime";
          }
          {
            type = "packages";
            key = "󰏗 Packages";
          }
          {
            type = "shell";
            key = "󰞷 Shell";
          }
          {
            type = "wm";
            key = "󱂬 WM";
          }
          {
            type = "terminal";
            key = "󰆍 Terminal";
          }
          {
            type = "cpu";
            key = "󰻠 CPU";
          }
          {
            type = "gpu";
            key = "󰍹 GPU";
          }
          {
            type = "memory";
            key = "󰑭 Memory";
          }
          {
            type = "swap";
            key = " Swap";
          }
          {
            type = "disk";
            key = "󰋊 Disk";
          }
          "break"
          {
            type = "colors";
            symbol = "circle";
          }
        ];
      };
    };
  };
}
