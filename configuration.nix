let hostname = builtins.replaceStrings [ "\n" ] [ "" ] (builtins.readFile ./hostname);
in
{ imports = [ (./hosts + "/${hostname}") ];

  networking.hostName = hostname;
}
