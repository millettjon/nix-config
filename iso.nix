# This module defines a small NixOS installation CD.  It does not
# contain any graphical stuff.
# See: https://nixos.wiki/wiki/Creating_a_NixOS_live_CD
# Building: nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=iso.nix

{config, pkgs, ...}:
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>

    # Provide an initial copy of the NixOS channel so that the user
    # doesn't need to run "nix-channel --update" first.
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];

  # Enable SSH in the boot process.
  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
  users.users.root = { openssh.authorizedKeys.keys = import ./keys/jam; };

  # How to search for packages:
  # nix-env -qaP '.*emacs.*'
  environment.systemPackages = with pkgs; [
    git
    emacs26-nox
  ];
}
