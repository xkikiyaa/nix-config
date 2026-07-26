{ config, pkgs, ...
}:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";
  
  programs.nix-ld.enable = true;

  fileSystems."/mnt/1TB" = {
  device = "UUID=ddac3bb1-5af3-48dd-aafc-178f38254bc2";
  fsType = "xfs";
  options = [ "defaults" ];
  };

  security.sudo.extraConfig = "Defaults pwfeedback";

  nixpkgs.config.allowUnfree = true;

    }
