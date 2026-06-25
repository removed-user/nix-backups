{
  description = "A collection of flake templates for adding your own lib functions";
  inputs = {
    flake-parts-lib = {
      url = "github:hercules-ci/flake-parts";
    };
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
  };

  outputs = {
    self,
    nixpkgs-lib,
    flake-parts-lib,
    ...
  } @ inputs:
  /**
  # 1. Keep your definitions flat and visible at the very top
  - Should Produce `Mylib.lib`.
  - A module argument you can pass around like lib, flake-parts-lib, etc.
  - Importable by users as seen below through
  imports = [${yourFlakeName}.myCustomModule];*


  # 2. You "may" want to define a system type if necessary.
     -  For pure nix-lib outputs, it's not required, and **can cause** issues for consumers.
      - If you're not exporting custom packages/modules/overlays, then you probably don't actually need it
  */
    flake-parts-lib.lib.mkFlake {inherit inputs;} {
      #  systems = [ "x86_64-linux" ];

      /**
      # Safely Dogfood "use" your module internally; (for testing);
       -  Without polluting consumers env
       >  please don't use overrides in-order to use your lib in your lib
       -  adding recursion problems or
       -  copying your lib to the store more than once
      */

      disabledModules = [
        inputs.flake-parts-lib.flakeModules.nixosModules
        inputs.flake-parts-lib.flakeModules.nixosConfigurations
        inputs.flake-parts-lib.flakeModules.apps
        inputs.flake-parts-lib.flakeModules.devShells
        inputs.flake-parts-lib.flakeModules.formatter
        inputs.flake-parts-lib.flakeModules.packages
        inputs.flake-parts-lib.flakeModules.legacyPackages
      ];

      imports = [
        # myCustomModule
        inputs.flake-parts-lib.flakeModules.flakeModules
        inputs.flake-parts-lib.flakeModules.modules
        inputs.flake-parts-lib.flakeModules.debug
      ];

      # Export your module for downstream consumers in global spec

      # Use your injected library inside perSystem safely

      # options = {
      #   Mylib = {
      #     type = lib.types.lazyAttrsOf lib.types.submodule;
      #   };
      # };
      config = {
        debug = true;
        flake.flakeModule = {
          default = ./flakeModule.nix;
          #   {
          #   inherit
          #     (nixpkgs-lib)
          #     lib
          #     ;
          # };
        };

        flake = {
          templates = import ./templates/default.nix;

          #
        };
      };
    };
}
