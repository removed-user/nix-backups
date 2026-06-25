{
  description = "Description for the project";

  inputs = {
    nixpkgs-lib = {
      url = "github:nix-community/nixpkgs.lib";
    };
    flake-parts-lib = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };

    bl = {
      url = "github:removed-user/bl";
      inputs = {
        nixpkgs-lib.follows = "nixpkgs-lib";
        flake-parts-lib.follows = "flake-parts-lib";
      };
    };
  };

  outputs = {
    flake-parts-lib,
    self,
    ...
  } @ inputs:
  # inputs.
    flake-parts-lib.lib.mkFlake {inherit inputs;} {
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
        # inputs.flake-parts-lib.flakeModules.flakeModules
        inputs.flake-parts-lib.flakeModules.modules
        #
        inputs.flake-parts-lib.flakeModules.debug
        # inputs.flake-parts-lib.flakeModules.flake
        # inputs.flake-parts-lib.flakeModules.checks
        # inputs.flake-parts-lib.flakeModules.withSystem
        # inputs.flake-parts-lib.flakeModules.moduleWithSystem
        # inputs.flake-parts-lib.flakeModules.transposition
      ];

      flake = {
        lib = {
          name = {
          };
        };
        modules = {
          generic = {
            self.lib = "test";
          };
        };
      };
      # systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      flake = {
        # The usual flake attributes can be defined here, including system-
        # agnostic ones like nixosModule and system-enumerating ones, although
        # those are more easily expressed in perSystem.
      };
    };
}
