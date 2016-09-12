with import <nixpkgs> {};
let
  hp = haskell.packages.ghc801.override {
    overrides = self: super: with haskell.lib; {
      haskell-tor = super.callPackage ./haskell-tor.nix {};
      memory = super.callPackage ./deps/memory_0_11.nix {};
      cryptonite = super.callPackage ./deps/cryptonite_0_9.nix {};
      tls = super.callPackage ./deps/tls_1_3_4.nix {};
    };
  };
in hp.haskell-tor
