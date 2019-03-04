{
  networking = {
    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts =  [ 22 ];
    };

    usePredictableInterfaceNames = false;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
