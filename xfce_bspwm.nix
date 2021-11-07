{ config, lib, pkgs, ...}: with lib;
{
	


	services.xserver = {
		enable = true;
		layout = "us";
	
		desktopManager.xfce = {
			enable = true;
			enableXfwm = false;
		};
	  
		windowManager.bspwm.enable = true;
		#windowManager.bspwm.configFile = "/home/svejk/dotfiles/common/bspwm/bspwmrc";
		#windowManager.bspwm.sxhkd.configFile= "/home/svejk/dotfiles/common/bspwm/sxhkdrc";
		desktopManager.xterm.enable = false;

		displayManager = {
      			defaultSession = "none+bspwm";
			
			lightdm = {
				enable = true; 
				greeters.gtk = {
				theme.package = pkgs.zuki-themes;
				theme.name = "Zukitre";
			};
                        };
      			autoLogin.enable = false;
      			autoLogin.user = "svejk";
			
    		};

	};
}
