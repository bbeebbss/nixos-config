{ config, lib, pkgs, ... }:
{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  # AMD Microcode
  hardware.cpu.amd.updateMicrocode = true;

  # Nix Config
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
    };
  };

  nixpkgs.config.allowUnfree = true;
  
  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth.settings = {
    General.Enable = "Source,Sink,Media,Socket";
  };

  musnix = {
    enable = true;
    rtcqs.enable = true;
    kernel.realtime = true;
  };

  # Graphics
  hardware.graphics.enable = true;
  hardware.opengl.enable = true;

  # Networking
  networking.networkmanager.enable = true;

  # SSH
  programs.ssh.startAgent = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # System Packages
  environment.systemPackages = with pkgs; [
     vim-full
     gitFull
     gnupg
  ];
}
