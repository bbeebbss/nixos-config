{ config, lib, pkgs, ... }:
{
  programs.gamemode.enable = true;
  
  programs.steam.enable = true;
  programs.steam.remotePlay.openFirewall = true;

  hardware.steam-hardware.enable = true;

  # VR Stuff :3

  services.wivrn = {
    enable = true;
    autoStart = true;
    openFirewall = true;
    highPriority = true;
    steam.importOXRRuntimes = true;
  };

  programs.adb.enable = true;
}
