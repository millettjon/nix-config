{ pkgs, ... }:
{ users = {
    # mutableUsers = false;
    # defaultUserShell = pkgs.zsh;
    users = { 
      root = {
        import "keys/jam";
      };
      jam = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        hashedPassword = "$6$UBf41fEq$eIBS2wi/9e1UaA/xxB7Gv.nom64TNxZU8gtJ0Ip6AM0XSce2ntCUWKX5CAKe8XeEifhR/TYQEUSilOq9PsneS1";
        import "keys/jam";
      };
    };
  };
}
