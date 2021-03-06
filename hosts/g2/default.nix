{ config, pkgs, ... }:
{ imports = [
    ./hardware-configuration.nix
    ../../cli
    ../../services/zfs.nix
  ];

  boot.loader.grub.device = "/dev/vda";

  # HACK: Create a symlink to allow nixos init script to find the zfs pool.
  # The nixos init script imports like this: "zpool import -d /dev/disk/by-id rpool"
  # and will fail if there is no /dev/disk/by-id symlink.
  # On vultr cloud instance, there is no symlink so make one manually.
  boot.initrd.postDeviceCommands = "ln -s /dev/vda3 /dev/disk/by-id/dev-vda3";

  # Required by zfs (8 hex random digits).
  # To get it, run: hexdump /etc/hostid
  networking.hostId = "e3498425";

  time.timeZone = "America/New_York";

  system.stateVersion = "18.09";
}
