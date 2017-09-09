{ config, pkgs, ... }:

{
  services.xserver.synaptics = rec {
    enable = true;
    accelFactor = "0";
    additionalOptions = ''Option "CoastingSpeed" "0"'';
    buttonsMap = [ 1 3 2 ];
    horizEdgeScroll = false;
    maxSpeed = "0.8";
    minSpeed = maxSpeed;
    palmDetect = true;
    tapButtons = false;
    twoFingerScroll = true;
    vertEdgeScroll = false;
  };
}
