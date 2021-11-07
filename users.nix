{ pkgs, ... }:

{
  users.extraUsers.kdb = {
    isNormalUser = true;
    home = "/home/kdb";
    uid = 1001;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
}
