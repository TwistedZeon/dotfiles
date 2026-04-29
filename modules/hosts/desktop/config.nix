{
  self,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.flake-parts.flakeModules.modules
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.nixosModules.desktopConfiguration =
    {
      pkgs,
      ...
    }:
    {
      imports = [
        # Include the results of the hardware scan.
        self.nixosModules.desktopHardware
        self.nixosModules.zfs
        self.nixosModules.drives
        self.nixosModules.homeManager
        self.nixosModules.defaults
        # self.nixosModules.gnome
        self.nixosModules.niri
        self.nixosModules.zen-browser
        self.nixosModules.git
        self.nixosModules.pipewire
        self.nixosModules.gaming
        self.nixosModules.communication
      ];

      # Disable channels completely.
      nix = {
        channel.enable = false;
        registry = (lib.mapAttrs (_: flake: { inherit flake; }) inputs);
        nixPath = lib.mapAttrsToList (n: _: "${n}") inputs;
        settings = {
          nix-path = lib.mapAttrsToList (n: _: "${n}") inputs;
          flake-registry = ""; # optional, ensures flakes are truly self-contained
          # Flakes
          experimental-features = [
            "nix-command"
            "flakes"
          ];
        };
      };

      # NixOS's default if no other display manager is set
      services.xserver.displayManager.lightdm.enable = false;

      # Zram
      zramSwap.enable = true; # Creates a zram block device and uses it as a swap device

      # Amd GPU
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };

      environment.variables = {
        MESA_SHADER_CACHE_MAX_SIZE = "12G";
      };

      programs.nix-ld = {
        enable = true;
        libraries = pkgs.steam-run.args.multiPkgs pkgs;
      };

      # services.ananicy = {
      #   enable = true;
      #   package = pkgs.ananicy-cpp;
      #   rulesProvider = pkgs.ananicy-rules-cachyos;
      # };

      # Optimise store
      nix.optimise.automatic = true;

      # Garbage collection
      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-tan 30d";
      };

      # Xbox controller driver.
      hardware.xone.enable = true;

      # Udev rules.
      services.udev.extraRules = ''
        ACTION=="add", SUBSYSTEM=="leds", DRIVERS=="xone-gip-gamepad", KERNELS=="gip0.0", ATTR{brightness}="2"
        ACTION=="change", SUBSYSTEM=="leds", DRIVERS=="xone-gip-gamepad", KERNELS=="gip0.0", ATTR{brightness}="2"
      '';

      # NFS
      boot.supportedFilesystems = [ "nfs" ];

      # Enable plymouth # Enables logo animation when booting
      boot.plymouth.enable = true;

      # Bootloader.
      # boot.loader.systemd-boot.enable = true;
      boot.loader.limine.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      services.upower.enable = true;

      services.power-profiles-daemon.enable = true;

      hardware.bluetooth.enable = true;

      networking.hostName = "zeon-nixos"; # Define your hostname.
      # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

      # Configure network proxy if necessary
      # networking.proxy.default = "http://user:password@proxy:port/";
      # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

      # Enable networking
      networking.networkmanager.enable = true;

      # Set your time zone.
      time.timeZone = "America/Toronto";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_CA.UTF-8";

      # Enable the X11 windowing system.
      services.xserver.enable = true;

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };

      # Enable CUPS to print documents.
      services.printing.enable = true;

      # Enable touchpad support (enabled default in most desktopManager).
      # services.xserver.libinput.enable = true;

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.zeon = {
        isNormalUser = true;
        initialHashedPassword = "$y$j9T$n8i3fa/lueN0ieqBO58kX.$3LvXEMCnbUq/ZN2epM0FrG83twXJ8Xwa8czfVxfGrb.";
        description = "Zeon";
        extraGroups = [
          "networkmanager"
          "wheel"
          "gamemode"
        ];
        # packages = with pkgs; [
        #  thunderbird
        # ];
      };

      # Fonts
      fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        source-code-pro
        source-sans-pro
        source-serif-pro
        roboto-mono
        roboto
        font-awesome
        nerd-fonts.jetbrains-mono
      ];

      programs.appimage = {
        enable = true;
        binfmt = true;
      };

      # List packages installed in system profile. To search, run:
      # $ nix search wget
      environment.systemPackages = with pkgs; [
        btop
        filezilla
        gimp
        libreoffice
        pwvucontrol
        feishin
        handbrake
        picard
        rsgain

        # Improved which for nix
        (writeShellApplication {
          name = "nwhich";
          text = /* sh */ ''readlink -f "$(which "$1")"'';
        })
        (writeShellApplication {
          name = "noctalia-copy";
          text = /* sh */ "nix run nixpkgs#noctalia-shell ipc call state all > ~/nixos/modules/features/noctalia.json";
        })

        #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by   default.
        #  wget
      ];

      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      # programs.mtr.enable = true;
      # programs.gnupg.agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      # };

      # List services that you want to enable:

      # Enable the OpenSSH daemon.
      # services.openssh.enable = true;

      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      networking.firewall.allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      networking.firewall.allowedUDPPorts = [
        62966
      ];
      networking.firewall.allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      # Or disable the firewall altogether.
      # networking.firewall.enable = false;

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "25.11"; # Did you read the comment?

    };

}
