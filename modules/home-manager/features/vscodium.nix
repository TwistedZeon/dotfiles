{ inputs, self, pkgs, ... }: {
   flake.homeModules.vscodium = { pkgs, ... }: {
     programs.home-manager.enable = true;
       programs.vscode = {
         enable = true;
         package = pkgs.vscodium;
       profiles.default = {
         userSettings = {
           "workbench.colorTheme" = "Default Light Modern";
           "breadcrumbs.enabled" = true;
           "chat.disableAIFeatures" = true;
           "editor.selectionClipboard" = false; # Turns off middle-mouse paste
           "editor.wordWrap" = "on";
           "extensions.autoCheckUpdates" = false;
           "extensions.autoUpdate" = false;
           "telemetry.telemetryLevel" = "off";
           "update.mode" = "none";
           "workbench.activityBar.location" = "top";
           "workbench.settings.showAISearchToggle" = false;
           "workbench.tree.indent" = 15;
           "nix.enableLanguageServer" = true;
           "nix.hiddenLanguageServerErrors" = [ "textDocument/definition" ];
           "nix.serverPath" = "nixd";
           "nix.serverSettings" = {
             "nixd" = {
               "formatting" = {
                 "command" = [ "nixfmt" ];
               };
               "options" = {
                 "nixos" = {
                   "expr" = "(builtins.getFlake \"~/nixos\").nixosConfigurations.desktop.options";
                 };
                 "home-manager" = {
                   "expr" = "(builtins.getFlake \"~/nixos\").homeConfigurations.zeon.options";
                 };
               };
             };
           };  
         extensions = with pkgs.vscode-extensions; [
           jnoortheen.nix-ide
         ];
       };
     };
   };
 };
}
