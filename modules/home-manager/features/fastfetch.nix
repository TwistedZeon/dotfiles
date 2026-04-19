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
          separator = "";
        };
        modules = [
          {
            type = "custom";
            key = "┌────────────────────────────────────────────────────────┐";
          }
          {
            type = "custom";
            key = "󰒓 System";
          }
          {
            type = "os";
            key = "│ ├ OS{#default}: {#}";
          }
          {
            type = "kernel";
            key = "│ ├󰍛 Kernel{#default}: {#}";
          }
          {
            type = "uptime";
            key = "│ ├ Uptime{#default}: {#}";
          }
          {
            type = "lm";
            key = "│ ├󰍃 DM{#default}: {#}";
          }
          {
            type = "wm";
            key = "│ ├󱂬 WM{#default}: {#}";
          }
          {
            type = "shell";
            key = "│ ├󰞷 Shell{#default}: {#}";
          }
          {
            type = "terminal";
            key = "│ └󰆍 Terminal{#default}: {#}";
          }
          {
            type = "custom";
            key = "󰘚 Hardware";
          }
          {
            type = "cpu";
            key = "│ ├󰻠 CPU{#default}: {#}";
          }
          {
            type = "gpu";
            key = "│ ├󰍹 GPU{#default}: {#}";
          }
          {
            type = "disk";
            key = "│ ├󰋊 Disk{#default}: {#}";
          }
          {
            type = "memory";
            key = "│ └󰑭 Memory{#default}: {#}";
          }
          {
            type = "custom";
            key = "└────────────────────────────────────────────────────────┘";
          }
        ];
      };
    };
  };
}
