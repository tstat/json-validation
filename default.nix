{ mkDerivation, aeson, base, containers, doctest, hashable, hspec
, iso8601-time, microlens, mtl, pcre-light, QuickCheck
, quickcheck-instances, quickcheck-text, scientific, stdenv, text
, unordered-containers, vector
}:
mkDerivation {
  pname = "json-validation";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [
    aeson base containers hashable iso8601-time microlens mtl
    pcre-light scientific text unordered-containers vector
  ];
  testHaskellDepends = [
    aeson base containers doctest hashable hspec iso8601-time microlens
    mtl pcre-light QuickCheck quickcheck-instances quickcheck-text
    scientific text unordered-containers vector
  ];
  homepage = "https://github.com/mitchellwrosen/json-validation#readme";
  description = "JSON schema validation";
  license = stdenv.lib.licenses.bsd3;
}
