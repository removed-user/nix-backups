{
  description = "NFX - Algebraic Effects System with Handlers in pure Nix";

  inputs = {
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
  };

  outputs = inputs: import ./outputs.nix inputs;
}
