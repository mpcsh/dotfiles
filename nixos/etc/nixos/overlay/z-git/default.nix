{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "z-git-${version}";
  version = "1.9";

  src = fetchFromGitHub {
    owner = "rupa";
    repo = "z";
    rev = "v${version}";
    sha256 = "1h0yk0sbv9d571sfkg97wi5q06cpxnhnvh745dlpazpgqi1vb1a8";
  };

  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir -p $out/bin $out/share/man/man1
    mv z.sh $out/bin/z
    chmod +x $out/bin/z
    mv z.1 $out/share/man/man1/z.1
  '';
}
