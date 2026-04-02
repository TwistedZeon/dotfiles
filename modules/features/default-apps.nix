{ self, inputs, ... }: {
  flake.nixosModules.gnome = { pkgs, lib, ... }: {
    xdg.mime.defaultApplications = {
      #"application/pdf" = "org.pwmt.zathura.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/mailto" = "thunderbird.desktop";
      "text/html" = "zen.desktop";
      "application/x-extension-htm" = "zen.desktop";
      "application/x-extension-html" = "zen.desktop";
      "application/x-extension-shtml" = "zen.desktop";
      "application/xhtml+xml" = "zen.desktop";
      "application/x-extension-xhtml" = "zen.desktop";
      "application/x-extension-xht" = "zen.desktop";
      "video/mp4" = "mpv.desktop";
      "video/mkv" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/avi" = "mpv.desktop";
      "video/x-msvideo" = "mpv.desktop";
      "video/ogg" = "mpv.desktop";
      "video/quicktime" = "mpv.desktop";
      "video/x-flv" = "mpv.desktop";
      "video/mpeg" = "mpv.desktop";
    };
  };
}
