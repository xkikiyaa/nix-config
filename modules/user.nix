{ config, pkgs, ...
}:

{

  users.users.rachel = {
    isNormalUser = true;
    description = "Lesley";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

}
