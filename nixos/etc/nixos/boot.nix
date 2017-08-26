{ config, pkgs, ... }:

hardware.cpu.intel.updateMicrocode = true;
boot.loader.efi.canTouchEfiVariables = true;
