# Base configuration for minimal command line interface usage.
{ pkgs, ... }:
{ imports = [
    ../users.nix
    ./programs.nix
    ./networking.nix
  ];
}
