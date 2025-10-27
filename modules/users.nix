{ config, lib, pkgs, ... }:
{
  # This is needed so that the password isnt reset back to "password"
  users.mutableUsers = true; 

  users.users = {

    bebs = {
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = [
        "wheel"
        "audio"
        "video"
        "rtkit"
        "realtime"
        "input"
        "adbusers"    
      ];
      packages = with pkgs; [
        blender-hip
        telegram-desktop
        firefox
        chromium
        keepassxc
        kicad
        kikit
        legcord
        freecad
        cables
        prismlauncher
        vintagestory
        gsettings-desktop-schemas
        vcv-rack
        zenity
        cardinal
        sidequest
        davinci-resolve
        nvtopPackages.full
        cmake
        reaper
        #reaper-sws-extension
        reaper-reapack-extension
        gpu-viewer
        texmaker
        gnuradio
        unityhub
        qpwgraph
        wineWowPackages.stable 
      ];
    };


    guest = {
      isNormalUser = true;
    };
    
  };
}
