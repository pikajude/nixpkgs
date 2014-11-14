# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, ansiTerminal, async, deepseq, ghcPaths, hspecExpectations
, hspecMeta, HUnit, QuickCheck, quickcheckIo, random, setenv
, silently, tfRandom, time, transformers
}:

cabal.mkDerivation (self: {
  pname = "hspec-core";
  version = "2.0.1";
  sha256 = "1yr2hkr1p95bpj5n6hqw20g8imqal6pva4nrvy0hmxdg53jyxcf7";
  buildDepends = [
    ansiTerminal async deepseq hspecExpectations HUnit QuickCheck
    quickcheckIo random setenv tfRandom time transformers
  ];
  testDepends = [
    ansiTerminal async deepseq ghcPaths hspecExpectations hspecMeta
    HUnit QuickCheck quickcheckIo random setenv silently tfRandom time
    transformers
  ];
  meta = {
    homepage = "http://hspec.github.io/";
    description = "A Testing Framework for Haskell";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
