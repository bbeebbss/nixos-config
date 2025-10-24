{ config, lib, pkgs, ... }:
{
  services.hardware.bolt.enable = true;

  # prevents luks key recovery through dma attacks
  # Also blacklists firewire drivers
  boot.initrd.luks.mitigateDMAAttacks = true;

  # rescans for pci devices when usb plugged in 
  #services.udev.extraRules = 
  #"
  #  
  #"
}
