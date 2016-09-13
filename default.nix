{ mkDerivation, array, asn1-encoding, asn1-types, async, attoparsec
, base, base64-bytestring, binary, bytestring, cereal, containers
, cryptonite, fingertree, hourglass, HUnit, memory, monadLib
, network, pretty-hex, pure-zlib, QuickCheck, stdenv
, test-framework, test-framework-hunit, test-framework-quickcheck2
, time, tls, x509, x509-store
}:
mkDerivation {
  pname = "haskell-tor";
  version = "0.1.2";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    array asn1-encoding asn1-types async attoparsec base
    base64-bytestring binary bytestring cereal containers cryptonite
    fingertree hourglass memory monadLib network pretty-hex
    pure-zlib time tls x509 x509-store
  ];
  executableHaskellDepends = [
    asn1-encoding asn1-types base base64-bytestring bytestring
    cryptonite hourglass memory network time tls x509
  ];
  testHaskellDepends = [
    asn1-types base binary bytestring cryptonite hourglass HUnit memory
    pretty-hex QuickCheck test-framework test-framework-hunit
    test-framework-quickcheck2 time x509
  ];
  homepage = "http://github.com/GaloisInc/haskell-tor";
  description = "A Haskell Tor Node";
  license = stdenv.lib.licenses.bsd3;
}
