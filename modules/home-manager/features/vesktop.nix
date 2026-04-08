{
  ...
}:
{
  flake.homeModules.vesktop = {
    programs.home-manager.enable = true;
    programs.vesktop = {
      enable = true;

      vencord.settings = {
        autoUpdate = true;
        autoUpdateNotification = true;
        notifyAboutUpdates = true;
        winNativeTitleBar = false;
        useQuickCss = true;
        themeLinks = [
          "https://raw.codeberg.page/AllPurposeMat/Disblock-Origin/DisblockOrigin.theme.css"
        ];

        plugins = {
          ClearURLs.enabled = true;
          CrashHandler.enabled = true;
          Dearrow.enabled = true;
          FakeNitro = {
            enabled = true;
            enableEmojiBypass = false;
            emojiSize = "48";
            transformEmojis = false;
            enableStickerBypass = false;
            stickerSize = "160";
            transformStickers = false;
            transformCompoundSentence = false;
            enableStreamQualityBypass = true;
            useHyperLinks = true;
            hyperLinkText = "{{NAME}}";
            disableEmbedPermissionCheck = false;
          };
          FixCodeblockGap.enabled = true;
          FixImagesQuality.enabled = true;
          FixSpotifyEmbeds.enabled = true;
          FixYoutubeEmbeds.enabled = true;
          NewGuildSettings = {
            enabled = true;
            guild = true;
            messages = "1";
            everyone = true;
            role = true;
            highlights = true;
            events = true;
            showAllChannels = true;
          };
          NoProfileThemes.enabled = true;
          NotificationVolume.enabled = true;
          OpenInApp = {
            enabled = true;
            spotify = true;
          };
          RelationshipNotifier = {
            enabled = true;
            notices = false;
            offlineRemovals = true;
            friends = true;
            friendRequestCancels = true;
            servers = true;
            groups = true;
          };
          ReverseImageSearch.enabled = true;
          ShowMeYourName = {
            enabled = true;
            mode = "user-nick";
            friendNicknames = "dms";
            displayNames = false;
            inReplies = false;
          };
          VolumeBooster.enabled = true;
          WebKeybinds.enabled = true;
          WebScreenShareFixes.enabled = true;
          YoutubeAdblock.enabled = true;
        };
        vencord.extraQuickCss = ''
          --display-gif-button: unset;
          --display-active-now: none;
          --display-badges: none;
          --display-server-member-activity: none;
        '';
      };
    };
  };
}
