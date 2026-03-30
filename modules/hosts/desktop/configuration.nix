{ self, inputs, lib, ... }: {
  imports = [ 
            inputs.flake-parts.flakeModules.modules
            inputs.home-manager.flakeModules.home-manager
            ];
  
  flake.nixosModules.desktopConfiguration = { config, pkgs, ... }: {
    imports = [ # Include the results of the hardware scan.
      self.nixosModules.desktopHardware
      self.nixosModules.homeManager
      self.nixosModules.gnome
      # self.nixosModules.niri
      self.nixosModules.zen-browser
      self.nixosModules.git
      self.nixosModules.mpv
      self.nixosModules.pipewire
      # self.nixosModules.gaming
      # self.nixosModules.communication
      
      # disko
      # inputs.disko.nixosModules.disko
      # self.diskoConfigurations.desktop
    ];
    
    # Flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    # Disable channels completely.
    nix = {
        channel.enable = false;
        registry = (lib.mapAttrs (_: flake: { inherit flake; }) inputs);
        nixPath = lib.mapAttrsToList (n: _: "${n}") inputs;
        settings = {
            nix-path = lib.mapAttrsToList (n: _: "${n}") inputs;
            flake-registry = ""; # optional, ensures flakes are truly self-contained
        };
     };

    # Zram
    # zramSwap.enable = true; # Creates a zram block device and uses it as a swap device
    
    # Amd GPU
    # hardware.graphics = {
    #   enable = true;
    #   enable32bit = true;
    # };

    # Xbox controller driver.
    hardware.xone.enable = true;

    # Udev rules.
    services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="leds", DRIVERS=="xone-gip-gamepad", KERNELS=="gip0.0", ATTR{brightness}="2"
      ACTION=="change", SUBSYSTEM=="leds", DRIVERS=="xone-gip-gamepad", KERNELS=="gip0.0", ATTR{brightness}="2"
    '';

    # Fish
    # programs.fish.enable = true;

    # Bootloader.
    # boot.loader.systemd-boot.enable = true;
    boot.loader.limine.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

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
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
      #  thunderbird
      ];
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
    # btop
    # filezilla
    # gimp
    # libreoffice
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
    # networking.firewall.allowedUDPPorts = [ ... ];
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
