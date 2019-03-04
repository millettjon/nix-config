{
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  # Increase the loader timeout to allow for remote console slowness e.g., on Linode/Vultr.
  boot.loader.timeout = 10;

  # boot.kernelParams = ["boot.shell_on_fail"];
}
