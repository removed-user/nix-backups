tests for Nix_Extra_Builders

Where I tried to figure out
1.the most idomatic way to auto-create options modules based on file/name mapping
2.how to write builders "entirely in lib/modules"
    - So package config could be error-checked through the module system
    - using partially applied functions
    - In order to be able to "atleast consider" **the mere concept** of ACTUALLY using functions to configure your system, instead of a bunch of hacky-options, that dont provide an interface for all compile-time options of all packages/source

Ultimately the goal was to move all the logic of the package build process into higher-order functions, where all derivation producing functions depend on an additional argument, so that a user can configure their system without the sloppy disaster of overrides.
