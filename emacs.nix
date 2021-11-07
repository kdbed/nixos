{ pkgs, fetchFromGitHub, ... }:

let
  rev = "ba37c07faa16afaf3669111d558175d264f3216e";
  emacs-overlay = import (builtins.fetchTarball {
    url =
      "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
  });
in {

  nixpkgs.overlays = [ emacs-overlay ];
  services.emacs.enable = true;
  programs.emacs = {
    enable = true;
    # Compile with imagemagick support so I can resize images.
    extraPackages = (epkgs:
      (with epkgs; [
        aggressive-indent
        all-the-icons-ivy
        avy
        company
        company-nixos-options
        counsel
        counsel-projectile
        dante
        dashboard
        define-word
        dired-narrow
        direnv
        disk-usage
        doom-modeline
        doom-themes
        esup
        evil
        evil-collection
        evil-exchange
        evil-magit
        evil-matchit
        evil-numbers
        evil-surround
        evil-tutor
        evil-visualstar
        expand-region
        fd-dired
        fill-column-indicator
        general
        git-gutter
        git-gutter-fringe
        git-timemachine
        golden-ratio
        haskell-mode
        hlint-refactor
        hydra
        ivy
        magit
        markdown-mode
        markdown-toc
        nix-mode
        nix-sandbox
        nix-update
        powershell
        ranger
      ]));
  };


  #home.file = {
  #  ".emacs.d" = {
  #    source = /home/svejk/system/emacs;
  #    recursive = true;};
  #    };

  xresources.properties = {
    # Set some Emacs GUI properties in the .Xresources file because they are
    # expensive to set during initialization in Emacs lisp. This saves about
    # half a second on startup time. See the following link for more options:
    # https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html#Fonts
    "Emacs.menuBar" = false;
    "Emacs.toolBar" = false;
    "Emacs.verticalScrollBars" = false;
    "Emacs.Font" = "Hack:size=16";
  };

  # Home manager's emacs service doesn't provide a desktop entry for the emacs
  # client. Note the %F on the `Exec=` line passes any file name string to tell
  # emacs to open a file. I just use Albert to launch the emacs client so I
  # don't every really need that.
}
