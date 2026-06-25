{
  inputs = {
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
    flake-parts.url = "github:removed-user/flake-parts/Add-a-Check-in-mkTransposedPersystemModule";
  };

  outputs = inputs @ {
    flake-parts,
    nixpkgs-lib,
    ...
  }: let
    nixpkgs-lib = inputs.nixpkgs-lib.lib;
    flake-parts-lib = inputs.flake-parts.lib;
  in
    flake-parts-lib.mkFlake {inherit inputs;} {
      disabledModules = [
        inputs.flake-parts.flakeModules.nixosModules
        inputs.flake-parts.flakeModules.nixosConfigurations
        inputs.flake-parts.flakeModules.apps
        inputs.flake-parts.flakeModules.devShells
        inputs.flake-parts.flakeModules.formatter
      ];

      imports = [
        inputs.flake-parts.flakeModules.flakeModules
        inputs.flake-parts.flakeModules.modules
        inputs.flake-parts.flakeModules.debug
      ];
      config = {
        debug = true;
      };
      # 3. Downstream export
      config.flake.flakeModules.default = {
        name =
          flake-parts-lib.imortApply ./functionTo_flakeModule.nix
          {
            inherit nixpkgs-lib;
            inherit (flake-parts-lib) imortApply;
          };
      };
    };
}
