{ pkgs, ... }:

let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";

    themeConfig = {
      HeaderTextColor = "#d5c4a1";
    };
  };

  sddm-xsetup = pkgs.writeShellScript "sddm-xsetup" ''
    ${pkgs.xorg.xrandr}/bin/xrandr --output DP-3 --off || true
  '';
in
{
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    autoNumlock = true;
    settings = {
      General = {
        DisplayServer = "x11";
      };

      X11 = {
        DisplayCommand = "${sddm-xsetup}";
      };
    };

    extraPackages = with pkgs; [
      sddm-astronaut
      kdePackages.qtmultimedia
      xorg.xrandr
    ];
  };

  environment.systemPackages = with pkgs; [
    sddm-astronaut
    kdePackages.qtmultimedia
    xorg.xrandr
  ];

  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
    discover
    okular
    qrca
    kate
  ];

  environment.etc."xdg/kcminputrc".text = ''
    [Keyboard]
    NumLock=0
  '';
}