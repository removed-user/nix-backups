Test Dir for NixLib-Boiler - 
where I wanted to make a common module-mergeable output for flake.lib
In order to aggregate all of the libraries I was going to have to "fix"
to be compatible with flakeModules
without each trying to evaluate your modules **in isolation**
so that I could manage to have every **inputs.flake**, that outputs its own library functions...

output them to one place, with merged and checked schema's, where the submodules eval lazily...

so that I could manage to use literally any flake, or any of the ecosystems tooling

Without it being comletely fucking broken

