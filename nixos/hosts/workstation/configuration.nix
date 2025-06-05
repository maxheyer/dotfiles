{ config, pkgs, lib, modulesPath, ... }:
{
  imports =
    [
        (modulesPath + "/installer/scan/not-detected.nix")
    ];

  nixpkgs.config.allowUnfree = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "uas" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s20f0u2u4u4.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  system.stateVersion = "24.11";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "workstation";

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  console.useXkbConfig = true;

  users.users.max = {
    isNormalUser = true;
    createHome = false;
    home = "/home/max";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  programs.git.enable = true;
  programs.neovim.enable = true;
  programs.command-not-found.enable = false;

  services.openssh.enable = true;
  services.printing.enable = false;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  services.xserver.videoDrivers = ["nvidia"];

  boot.kernelPackages = pkgs.linuxPackages;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  boot.kernelParams = [
    "quiet"
    "loglevel=3"
    "nvidia-drm.modeset=1"
  ];

  boot.initrd.luks.devices."cryptroot".device = "/dev/nvme0n1p2";

  fileSystems."/" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };
  fileSystems."/home" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@home" ];
    neededForBoot = true;
  };
  fileSystems."/nix" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@nix" ];
  };
  fileSystems."/persist" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@persist" ];
    neededForBoot = true;
  };
  fileSystems."/var/log" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@log" ];
  };
  fileSystems."/.snapshots" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@snapshots" ];
  };
  fileSystems."/boot" = {
    device = "/dev/nvme0n1p1";
    fsType = "vfat";
  };

  environment.systemPackages = with pkgs; [
  vim
  git
  neovim
  wget
  curl
  unzip
  htop
  config.boot.kernelPackages.nvidia_x11.bin
  gnome-tweaks
  gnomeExtensions.appindicator
  gnomeExtensions.dash-to-dock
  gnomeExtensions.user-themes
  ];

environment.gnome.excludePackages = with pkgs; [
  # Remove unwanted GNOME packages (optional)
  gnome-photos
  gnome-tour
  gnome-connections
  epiphany # GNOME web browser (since you have Firefox)
  geary    # GNOME mail client
];
  services.snapper.configs.root = {
    SUBVOLUME = "/";
    ALLOW_USERS = [ "max" ];
    TIMELINE_CREATE = true;
    TIMELINE_CLEANUP = true;
  };

  environment.persistence."/persist" = {
    directories = [
      "/etc/ssh"
      "/var/lib/nixos"
    ];
    users.max.directories = [
      "."
      "Downloads"
      "Projects"
    ];
    users.max.files = [
    ];
  };

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  systemd.services."home-manager-max".after = [ "local-fs.target" ];
  systemd.services."home-manager-max".requires = [ "local-fs.target" ];
}
