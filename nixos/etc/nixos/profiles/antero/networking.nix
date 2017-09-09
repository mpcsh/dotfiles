{ config, pkgs, ... }:

{
  networking.firewall =
  let
    ports = [ 80 443 3000 3737 6667 8384 25565 39999 ];
  in {
    allowedTCPPorts = ports;
    allowedUDPPorts = ports;
  };

  services.openssh = {
    enable = true;
    ports = [ 39999 ];
    passwordAuthentication = false;
    permitRootLogin = "no";
  };

  services.caddy = {
    enable = true;
    agree = true;
    config = ''
      mpc.sh, www.mpc.sh {
      gzip
      log syslog

      root /storage/wobsite/public
      }
    '';
    email = "m@mpc.sh";
  };

  services.znc = {
    enable = true;
    confOptions = {
      # global modules
      modules = [ "adminlog" "certauth" "webadmin" ];

      # web admin login
      port = 3737;
      userName = "mpcsh";
      passBlock = ''
        <Pass password>
        Method = sha256
        Hash = 87c52d149bf8149ccb741e276d1a957c37fbf78aa88dc6b826e958726a03a2fd
        Salt = tz,MxsQv_Yw4i8f.z07t
        </Pass>
      '';

      # network setup
      nick = "mpcsh";
      networks =
      let
        makeBaseConf = { server, channels }:
        {
          channels = channels;
          modules = [ "cert" "simple_away" ];
          server = server;
        };
      in
      {
        freenode = (makeBaseConf {
          server = "chat.freenode.net";
          channels = [ "#nixos" "#lobsters" ];
        });
        nixers = (makeBaseConf {
          server = "unix.chat";
          channels = [ "#nixers" ];
        });
        rizon = (makeBaseConf {
          server = "irc.rizon.net";
          channels = [ "#rice" ];
        });
      };
    };
  };
}
