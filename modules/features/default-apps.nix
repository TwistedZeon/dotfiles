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
        "application/pdf" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
        "x-scheme-handler/mailto" = "thunderbird.desktop";
        "text/html" = "zen.desktop";
        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";
        "video/*" = "mpv.desktop";
        "image/*" = "com.interversehq.qView.desktop";
        "inode/directory" = "nemo";
      };
    };
}
