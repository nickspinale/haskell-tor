{ mkDerivation, base, bytestring, deepseq, ghc-prim, stdenv, tasty
, tasty-hunit, tasty-quickcheck
}:
mkDerivation {
  pname = "memory";
  version = "0.11";
  sha256 = "19iz9vzmlzp3aqa9xanim0lr772l1lg7qkw81b6g8mzrvqjs6zvv";
  libraryHaskellDepends = [ base bytestring deepseq ghc-prim ];
  testHaskellDepends = [ base tasty tasty-hunit tasty-quickcheck ];
  homepage = "https://github.com/vincenthz/hs-memory";
  description = "memory and related abstraction stuff";
  license = stdenv.lib.licenses.bsd3;
}
