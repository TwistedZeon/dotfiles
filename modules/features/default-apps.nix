{
  ...
}:
{
  flake.nixosModules.defaults =
    {
      ...
    }:
    {
      xdg.mime.defaultApplications = {
        "application/pdf" = "zen.desktop";
        "x-scheme-handler/http" = "zen.desktop";
        "x-scheme-handler/https" = "zen.desktop";
        "x-scheme-handler/about" = "zen.desktop";
        "x-scheme-handler/unknown" = "zen.desktop";
        "x-scheme-handler/mailto" = "thunderbird.desktop";
        "text/html" = "zen.desktop";
        "application/x-extension-htm" = "zen.desktop";
        "application/x-extension-html" = "zen.desktop";
        "application/x-extension-shtml" = "zen.desktop";
        "application/xhtml+xml" = "zen.desktop";
        "application/x-extension-xhtml" = "zen.desktop";
        "application/x-extension-xht" = "zen.desktop";
        "video/*" = "mpv.desktop";
        "image/*" = "com.interversehq.qView.desktop";
        "inode/directory" = "nemo";
      };
    };
}
