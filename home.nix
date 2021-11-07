{ config, pkgs, ... }:

let
  homeDir = builtins.getEnv "HOME";
in {
  imports = [ ./emacs.nix ];

  home.stateVersion = "20.09";

  manual.manpages.enable = false;

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "emacsclient --create-frame --alternate-editor emacs";
  };

  #home.file = {
  #  ".config".source = ../config;
  #  ".config".recursive = true;
  #  ".xmonad/xmonad.hs".source = ../xmonad/xmonad.hs;
  #    master en_US
  #};

  xdg.enable = true;

  home.packages = with pkgs; [
    binutils
    cabal-install
    calibre
    chromium
    dnsutils
    gnome3.gnome-screenshot
    exa
    gcc
    ghc
    gimp
    gnupg
    keepassxc
    nix-prefetch-git
    nixfmt
    openconnect
    ranger
    rustup
    simple-scan
    python3
    stack
    syncthing-cli # provides stcli
    tokei
    transmission-gtk
    unzip
    vlc
    zip
    fzf
  ];

    programs.alacritty = {
    enable = true;

    settings = {
        env = {
    "TERM" = "xterm-256color";
  };
      window = {
        title = "Terminal";

        padding = { y = 5; };
        dimensions = {
          lines = 75;
          columns = 100;
        };
      };

      font = {
        normal.family = "Hack";
        size = 16.0;
      };

      background_opacity = 0.8;

      shell = { program = "${pkgs.zsh}/bin/zsh"; };

      # Colors (Nord)
colors = {
  # Default colors
  primary = {
    background = "0x2E3440";
    foreground = "0xD8DEE9";
  };
  # Normal colors
  normal = {
    black =   "0x3B4252";
    red =     "0xBF616A";
    green =   "0xA3BE8C";
    yellow =  "0xEBCB8B";
    blue =    "0x81A1C1";
    magenta = "0xB48EAD";
    cyan =    "0x88C0D0";
    white =   "0xE5E9F0";
  };
  # Bright colors
  bright = {
    black =   "0x4C566A";
    red =     "0xBF616A";
    green =   "0xA3BE8C";
    yellow =  "0xEBCB8B";
    blue =    "0x81A1C1";
    magenta = "0xB48EAD";
    cyan =    "0x8FBCBB";
    white =   "0xECEFF4";
  };
};
    };
  };
  programs.git = {
    enable = true;
    userName = "kdbed";
    userEmail = "kbednar3@kent.edu";
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    enableAutosuggestions = true;
    shellAliases = {
      l = "exa";
      ll = "exa -l";
      la = "exa -lah";
    };
    oh-my-zsh = {
      enable = true;
      theme = "lambda";
      plugins = [
	"ripgrep"
	"cargo"
	"rust"
	"fd"
       ];
    };
  };


  #starship.enable = true;


  programs.htop = {
    enable = true;
    meters = {
      left = [ "AllCPUs" "Memory" "Swap" ];
      right = [ "Tasks" "LoadAverage" "Uptime" ];
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  #programs.ssh = {
  #  enable = true;
  #  serverAliveInterval = 30;

  #  matchBlocks."github" = {
  #    hostname = "github.com";
  #    identityFile = "~/.ssh/id_rsa_github";
  #  };
  #};

    services = {
    picom = {
      enable = true;
      fade = true;
      vSync = true;
      experimentalBackends = true;
    #  # the default 'glx' backend lags like crazy for me for some reason.
      backend = "xrender";
      fadeDelta = 1;
    #  # I only want transparency for a couple of applications.
      opacityRule = [
        "95:class_g *?= 'emacs' && focused"
        "75:class_g *?= 'emacs' && !focused"
        "90:class_g ?= 'alacritty' && focused"
        "75:class_g ?= 'alacritty' && !focused"
      ];
    };


   };
  services.redshift = {
    enable = true;
    latitude = "33";
    longitude = "-97";
    temperature.day = 6500;
    temperature.night = 1800;
  };

  services.lorri.enable = true;

  #services.syncthing.enable = true;



  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome3.adwaita-icon-theme;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome3.gnome_themes_standard;
    };
  };
}
