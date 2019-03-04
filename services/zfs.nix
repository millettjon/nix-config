{
  # ZFS
  # See: https://nixos.wiki/wiki/NixOS_on_ZFS

  boot.loader.grub.zfsSupport = true;
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs = {

    # Force importing since otherwise it sometimes refuses to import at boot e.g., after a new install.    
    forceImportRoot = true;
    forceImportAll = true;

    # enableUnstable = true;
  };

  services.zfs.autoScrub.enable = true;
}
