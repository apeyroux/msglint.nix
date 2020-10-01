with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "msglint-1.04";

  setSourceRoot = "sourceRoot=`pwd`";
  
  src = fetchurl {
    url = "https://tools.ietf.org/tools/msglint/msglint-1.04.tar.gz";
    sha256 = "1yasj6nijip3z86m526bsssd5vgqrx233azvpz1c0z564wngvzbm";
  };

  patches = [ ./fixfree.patch ];

  installPhase = ''
    mkdir -p $out/bin
    cp msglint $out/bin/msglint
  '';
}
