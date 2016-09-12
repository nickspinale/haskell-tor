{ mkDerivation, asn1-encoding, asn1-types, async, base, bytestring
, cereal, cryptonite, data-default-class, hourglass, memory, mtl
, network, QuickCheck, stdenv, tasty, tasty-quickcheck
, transformers, x509, x509-store, x509-validation
}:
mkDerivation {
  pname = "tls";
  version = "1.3.4";
  sha256 = "1h8r3vcw572wd4sr3qkj9bzsaivml7wlb167gizva2s2dfyz5zs9";
  revision = "2";
  editedCabalFile = "160911eae9f313bf2bc9a86db576c8ce03e42b8523ee08b210ff4253ead31562";
  libraryHaskellDepends = [
    asn1-encoding asn1-types async base bytestring cereal cryptonite
    data-default-class memory mtl network transformers x509 x509-store
    x509-validation
  ];
  testHaskellDepends = [
    base bytestring cereal cryptonite data-default-class hourglass mtl
    QuickCheck tasty tasty-quickcheck x509 x509-validation
  ];
  homepage = "http://github.com/vincenthz/hs-tls";
  description = "TLS/SSL protocol native implementation (Server and Client)";
  license = stdenv.lib.licenses.bsd3;
}
