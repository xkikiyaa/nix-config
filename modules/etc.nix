{ config, pkgs, ...
}:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";

  fileSystems."/mnt/1TB" = {
  device = "UUID=97669173-4bbc-4eaa-be13-8e17f2357c35";
  fsType = "xfs";
  options = [ "defaults" ];
  };

  security.sudo.extraConfig = "Defaults pwfeedback";

  nixpkgs.config.allowUnfree = true;

    }
