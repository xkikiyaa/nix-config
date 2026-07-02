{ config, pkgs, ...
}:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";
  
  programs.nix-ld.enable = true;

  fileSystems."/mnt/1TB" = {
  device = "UUID=f23ccb7e-21fb-4c00-baf0-7b6f4190b721";
  fsType = "xfs";
  options = [ "defaults" ];
  };

  security.sudo.extraConfig = "Defaults pwfeedback";

  nixpkgs.config.allowUnfree = true;

    }
