{ pkgs, ... }:
{ users = {
    mutableUsers = false;
    # defaultUserShell = pkgs.zsh;
    users = { 
      root = {
        openssh.authorizedKeys.keys = import ./keys/jam;
      };
      jam = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        openssh.authorizedKeys.keys = import ./keys/jam;
      };
    };
  };
}
