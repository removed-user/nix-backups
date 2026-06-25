A project where I decoupled Paissano from nosys, and started integrating it into flake-parts;
Because I wanted a well-organized architecture I could use for function declarations

with strategy and adapter patterns, in order to not make my codebases tightly coupled and dependent.

Why not finish that?

Because in doing so, and setting up integrations with haumea... I found an infinite recusion problem caused by haumea
Which actually breaks flakeModules entirely, reported that on one account,
was ignored...
Realized I'd have to practically re-write it completely to not break flakeModules;

Started doing that in FsLib, before realizing
I had started off trying to fix a problem with Nix_Extra_Builders, using nix libraries that exist...

ran into an issue, with the code being way too tightly coupled while either...
- duplicating imports
- losing debug-info
- overriding standard nixpkgs components in a fixed-point...

and the original author either:
- has abandoned the project
- is dismissive of simple changes like "not using known bad patterns, which we have known good replacements for", instead questioning whether you understand "x" basic thing.
- refuses to listen about how "y" is a problem.
- Thinks everything they do is perfect.

Realized I'd practically have to rewrite the project myself to fix it, or fork it to fix "just one" thing.
Did that...

Tried to decouple the usefull code, and NOT have the same footguns...

Maybe make that easier for myself using a different well-known popular nix library, then...

ran into an issue, with the code being way too tightly coupled while either...
- duplicating imports
- losing debug-info
- overriding standard nixpkgs components in a fixed-point... that caused it to...
Have infinite recursion errors if used when importing a flakeModule.

Realized I'd practically have to rewrite the project myself to fix it, or fork it to fix "just one" thing.
then on
and-on
and-on
