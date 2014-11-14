# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, async, attoparsec, doctest, filepath, free, hspec
, hspecExpectationsLens, httpClient, httpClientTls, httpTypes, lens
, liftedAsync, liftedBase, monadControl, mtl, network, networkUri
, profunctors, text, transformers, xmlConduit
}:

cabal.mkDerivation (self: {
  pname = "libjenkins";
  version = "0.6.0";
  sha256 = "0rcqmj5myi2wy2acd59gqdfwiiapw1zwzm71bjqb1y66z0rnrkx4";
  buildDepends = [
    attoparsec free httpClient httpClientTls httpTypes liftedAsync
    liftedBase monadControl mtl network networkUri profunctors text
    transformers
  ];
  testDepends = [
    async attoparsec doctest filepath free hspec hspecExpectationsLens
    httpClient httpClientTls httpTypes lens liftedAsync liftedBase
    monadControl mtl network networkUri profunctors text transformers
    xmlConduit
  ];
  jailbreak = true;
  doCheck = false;
  meta = {
    description = "Jenkins API interface";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
