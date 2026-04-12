{
  ...
}:
{
  flake.homeModules.mpv =
    {
      pkgs,
      ...
    }:
    {
      programs.mpv = {
        enable = true;
        scripts = with pkgs.mpvScripts; [
          uosc
          thumbfast
        ];

        config = {
          profile = "high-quality";
          window-maximized = "yes";
          hwdec = "auto";
          gpu-context = "wayland";
          osd-font = "Adwaita Sans";
          border = false;
        };

        extraInput = ''
          ctrl+r cycle_values video-rotate "90" "180" "270" "0"
        '';
      };
    };
}
