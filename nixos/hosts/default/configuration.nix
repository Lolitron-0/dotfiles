# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, outputs, ... }:

{
  imports =
    [
      outputs.nixosModules.default
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  myNixOSModules =
    {
      bundles.general.enable = true;
      sharedSettings.hyprland.enable = true;
      userName = "niten";
      userConfig = ./home.nix;
    };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.niten = {
    isNormalUser = true;
    description = "niten";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      #  thunderbird
    ];
  };

  # home-manager = {
  #   extraSpecialArgs = { inherit inputs; };
  #   users = {
  #     "niten" = import ./home.nix;
  #   };
  # };

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;




  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };


  # Allow unfree packages

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    let
      llvm = pkgs.llvmPackages_latest;
    in
    with pkgs; [
      git
      kitty
      telegram-desktop
      wget

      cmake
      ninja
      llvm.lldb
      gdb
      clang-tools
      llvm.libstdcxxClang
      cppcheck
      llvm.libllvm
      llvm.libcxx
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
  system.stateVersion = "23.11"; # Did you read the comment?

}
