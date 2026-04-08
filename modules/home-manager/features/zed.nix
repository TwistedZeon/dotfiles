{
  ...
}:
{
  flake.homeModules.zed = {
    programs.home-manager.enable = true;
    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
      ];
      userSettings = {
        theme = {
          mode = "light";
          dark = "One Dark";
          light = "One Light";
        };
        hour_format = "hour12";
        buffer_font_family = "Roboto Mono";
        vim_mode = false;
        diagnostics = {
          inline = {
            enabled = true;
            min_column = 80;
          };
        };
        telemetry = {
          diagnostics = false;
          metrics = false;
        };
        lsp = {
          nix = {
            binary = {
              path_lookup = true;
            };
          };
        };
        languages = {
          "Nix" = {
            language_servers = [ "nixd" ];
            external = {
              arguments = [
                "--quiet"
                "--"
              ];
              command = "nixfmt";
            };
          };
          "JSON" = {
            external = {
              arguments = [
                "format"
                "--stdin-file-path"
                "{buffer_path}"
              ];
              command = "biome";
            };
          };
        };
      };
    };
  };
}
