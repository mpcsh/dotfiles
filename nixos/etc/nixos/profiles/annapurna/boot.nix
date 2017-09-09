{ config, pkgs, ... }:

{
  hardware.cpu.intel.updateMicrocode = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    # required for uefi
    device = "nodev";
    efiSupport = true;

    # winblows entry
    extraEntries = ''
      menuentry "Winblows 8.1" {
      insmod part_gpt
      insmod search_fs_uuid
      insmod chain
      search --fs-uuid --no-floppy --set=root 4023-cd4e
      chainloader ($root)/EFI/MICROSOFT/BOOT/bootmgfw.efi
      }
    '';
  };
}
