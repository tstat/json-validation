{ compiler ? "ghc843" }:

let json-validation-overlay =
  let haskell-overrides = self: super:
    with super.haskell.lib; {
      json-validation = super.callPackage ./default.nix {};
    };
  in self: super:
      {
        haskell = super.haskell // {
          packages = super.haskell.packages // {
            "${compiler}" = super.haskell.packages."${compiler}".override {
              overrides = haskell-overrides;
            };
          };
        };
      };
    pkgs = import <nixpkgs> { overlays = [ json-validation-overlay ]; };
in with pkgs.haskell.packages."${compiler}"; {
  json-validation = json-validation;
}
