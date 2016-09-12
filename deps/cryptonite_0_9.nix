{ mkDerivation, base, byteable, bytestring, deepseq, ghc-prim
, integer-gmp, memory, stdenv, tasty, tasty-hunit, tasty-kat
, tasty-quickcheck
}:
mkDerivation {
  pname = "cryptonite";
  version = "0.9";
  sha256 = "1h22x22lq2m8h456v5j50xm0l25bcm3h1pchsk83br909hjxql4z";
  libraryHaskellDepends = [
    base bytestring deepseq ghc-prim integer-gmp memory
  ];
  testHaskellDepends = [
    base byteable bytestring memory tasty tasty-hunit tasty-kat
    tasty-quickcheck
  ];
  homepage = "https://github.com/haskell-crypto/cryptonite";
  description = "Cryptography Primitives sink";
  license = stdenv.lib.licenses.bsd3;
}
