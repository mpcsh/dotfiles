self: super:
{
  ## example:
  # shblah-git = super.callPackage ./shblah-git { };

  spotify-new = super.callPackage ./spotify-new {
    inherit (super.gnome2) GConf;
    libgcrypt = super.libgcrypt_1_5;
    libpng = super.libpng12;
    curl = super.curl.override {
      sslSupport = false; gnutlsSupport = true;
    };
  };
}
