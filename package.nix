{ config, pkgs, lib, stable, rolling, ...}:
with lib;
{
	nixpkgs.config.allowUnfree = true;
	environment.systemPackages =
	(with stable; [
		# Apperence
		arc-theme
		arc-icon-theme
                xorg.xbacklight
		zuki-themes
		gnome3.gnome_themes_standard
		gtk_engines
		gtk-engine-murrine
		polybar
		tango-icon-theme
		trayer
		xorg.xrandr
		feh

    # Software
		#calibre
		colordiff
   # darktable
		#emacs
		i3lock
		less
    lxappearance
		neovim
    openconnect
    openvpn
		pavucontrol
    ranger
		roxterm
		tig
		tldr
		xarchiver
		x11vnc
		zathura  # PDF Viewer

		# System
		arandr
    acpi
		bashmount
		curl
    cryptsetup
		davfs2
		exfat
		fam
		ghc
		git
    go-sct
#		jdk
#		jre
		shared_mime_info
		lxmenu-data
		networkmanagerapplet
		ntfs3g
		numlockx
 #   redshift
    pciutils
    python
		unrar
		unzip
    wget
		xbrightness
		xdotool
		xorg.libXt
		xorg.libXtst
    cifs_utils

    #System Monitoring
		htop # task/process-manager
    psensor # monitor temperature
    screenfetch # system information
    s-tui # monitor CPU temperature, frequency, power
	  xfce.xfce4-taskmanager
    zsh
    oh-my-zsh


  #lxappearance
  dino
	]);
}


