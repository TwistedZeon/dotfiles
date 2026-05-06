{
  ...
}:
{
  flake.homeModules.firefox = {
    programs.home-manager.enable = true;
    programs.firefox = {
      enable = true;

      configPath = ".config/mozilla/firefox";

      profiles.default = {
        id = 0;
        isDefault = true;

        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "sidebar.revamp" = false;
          "browser.startup.homepage" = "https://homepage.ug-games.dedyn.io/";
          "browser.download.autohideButton" = false;
        };

        userChrome = builtins.readFile ./userChrome.css;
      };
    };
  };
}
