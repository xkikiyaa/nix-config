{ config, pkgs, ...
}:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";
  
  programs.nix-ld.enable = true;

  fileSystems."/mnt/1TB" = {
  device = "UUID=109cddd7-cfdc-46c4-beff-698b7a1078c6";
  fsType = "xfs";
  options = [ "defaults" ];
  };

  security.sudo.extraConfig = "Defaults pwfeedback";

  nixpkgs.config.allowUnfree = true;

    }
