{ pkgs, ... }:

let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";

    themeConfig = {
      HeaderTextColor = "#d5c4a1";
    };
  };
in
{
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;

    theme = "sddm-astronaut-theme";

    extraPackages = with pkgs; [
      sddm-astronaut
      kdePackages.qtmultimedia
    ];
  };

  environment.systemPackages = with pkgs; [
    sddm-astronaut
    kdePackages.qtmultimedia
  ];

  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
    discover
    okular
    qrca
  ];

  environment.etc."xdg/kcminputrc".text = ''
    [Keyboard]
    NumLock=0
  '';
}
