{ config, pkgs, ...
}:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";
  
  programs.nix-ld.enable = true;

  fileSystems."/mnt/1TB" = {
  device = "UUID=39440d18-245a-42a0-9a39-0d2753765b77";
  fsType = "xfs";
  options = [ "defaults" ];
  };

  security.sudo.extraConfig = "Defaults pwfeedback";

  nixpkgs.config.allowUnfree = true;

    }
