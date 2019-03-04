{ pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    # Basic Utilities
    which
    tree
    wget
    curl
    zip unzip
    entr
    killall

    # sysadmin utilities
    htop

    # Terminal
    tmux

    # Editors
    emacs26-nox

    # Version Control
    git
    tig

    # Passwords/Encryption
    gnupg

    # Scripting
    ruby
  ];
}
