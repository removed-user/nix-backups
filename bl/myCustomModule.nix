let
  outputs.lib = {
    self,
    lib,
    ...
  }: {
    lib = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.deferredModule;
      default = {};
      description = ''A Schema for outputting a "lib", at the top-level of your flake'';
    };
    # _class = "generic";
    # options = {};
    # config = {};
    # _module.args.Mylib = lib.mkOption {};
    # {
    # lib1 = import ./flakeModule.nix {inherit lib;}; # import a/the default flakeModule, and load lib from it
    # #or
    # lib2.define_monad = rec {
    #   whatsAMonad = self: ''A Monad is just a monoid in the category of endofunctors'';
    #   __functor = self: whatsAMonad;
    # };
    # };
  };
in
  outputs.lib
