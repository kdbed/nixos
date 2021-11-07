{ config, pkgs, lib, ...}:

let
	nixcfg = {allowUnfree = true;};
	stable = import (fetchTarball http://nixos.org/channels/nixos-20.09/nixexprs.tar.xz) { config = nixcfg; };
	rolling = import (fetchTarball https://github.com/nixos/nixpkgs-channels/archive/nixos-unstable.tar.gz) {  config = nixcfg; };

	pkgs = stable;
in
{
	imports = [
    #./hardware-configuration.nix
		./xfce_bspwm.nix
		./fonts.nix
		./users.nix
		"${builtins.fetchTarball https://github.com/rycee/home-manager/archive/release-20.03.tar.gz}/nixos"
		(import ./package.nix {inherit lib config pkgs stable rolling; })
	];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = false;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  boot.cleanTmpDir = true;




  networking.hostName = "nixos"; # Define your hostname.

  # time.timeZone = "Europe/Amsterdam";

  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;


  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };






security.sudo.wheelNeedsPassword = false;




  programs.light.enable = true;
  programs.dconf.enable = true;
  programs.qt5ct.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.svejk = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
   };

   home-manager.users.svejk = import ./home.nix ;

  environment.systemPackages = with pkgs; [
    htop
    pywal
    wget
    fzf
    firefox
    fd
    (import ./vim.nix)
    ripgrep
    git
    kitty
    rofi
    light
    bspwm
    tree
    curl
    killall
    alacritty
  ];

  services.openssh.enable = true;

  system.stateVersion = "20.09"; # Did you read the comment?

}

