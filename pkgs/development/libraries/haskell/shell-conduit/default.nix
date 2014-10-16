# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, async, conduit, conduitExtra, controlMonadLoop, filepath
, monadControl, monadsTf, resourcet, semigroups, split, text, these
, transformers, transformersBase
}:

cabal.mkDerivation (self: {
  pname = "shell-conduit";
  version = "4.2";
  sha256 = "1ac1imsz1ffm0ldi29ylprgs4zh0qhn52ka17zn8f9301hfx9vhc";
  buildDepends = [
    async conduit conduitExtra controlMonadLoop filepath monadControl
    monadsTf resourcet semigroups split text these transformers
    transformersBase
  ];
  meta = {
    description = "Write shell scripts with Conduit";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
