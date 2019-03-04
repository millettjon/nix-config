{ config, pkgs, ... }:
{ imports = [
    ./hardware-configuration.nix
    ../../users.nix
    ../../cloud/programs.nix
    ../../cloud/networking.nix
  ];

  services.zfs.autoScrub.enable = true;

  # ZFS
  # See: https://nixos.wiki/wiki/NixOS_on_ZFS
  boot = {
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/vda";
      zfsSupport = true;
    };

    # HACK: Create a symlink to allow nixos init script to find the zfs pool.
    # The nixos init script imports like this: "zpool import -d /dev/disk/by-id rpool"
    # and will fail if there is no /dev/disk/by-id symlink.
    # On vultr cloud instance, there is no symlink so make one manually.
    initrd.postDeviceCommands = "ln -s /dev/vda3 /dev/disk/by-id/dev-vda3";

    supportedFilesystems = [ "zfs" ];
    # zfs.enableUnstable = true;
    zfs.forceImportRoot = true;
    zfs.forceImportAll = true;
    # kernelParams = ["boot.shell_on_fail"];
  };

  # Required by zfs (8 hex random digits).
  # To get it, run: hexdump /etc/hostid
  networking.hostId = "e3498425";

  time.timeZone = "America/Chicago";

  system.stateVersion = "18.09";
}
