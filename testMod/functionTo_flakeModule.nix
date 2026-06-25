{
  flake-parts-lib,
  nixpkgs-lib,
  self,
  ...
}: let
  inherit (flake-parts-lib) importApply;
  LIB = nixpkgs-lib.lib;
in {
  flake.flakeModules.default = importApply ./flakeModule.nix {
    providerFlake = self;
  };
}
