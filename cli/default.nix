# Base configuration for minimal command line interface usage.
{ pkgs, ... }:
{ imports = [
    ../boot.nix
    ../users.nix
    ./programs.nix
    ./networking.nix
  ];
}
