# This providerFlake function recieves "self", passed from our flakeModule declaration as the aruement to providerFlake.
providerFlake: {
  flake-parts-lib,
  lib,
  inputs,
  ...
}: {
  # _class = "generic";

  options.flake = {
    lib = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.deferredModule;
      default = {};
      description = ''A Schema for outputting a "lib", at the top-level of your flake'';
    };
  };
  config = {
    _module.args.Mylib = {
      lib1 = import ./lib1.nix {inherit lib;}; # import a/the default flakeModule, and load lib from it
      #or
      lib2.define_monad = rec {
        whatsAMonad = self: ''A Monad is just a monoid in the category of endofunctors'';
        __functor = self: whatsAMonad;
      };
    };
  };

  # _module.args.Mylib
}
