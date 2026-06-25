repl() {
nix repl -- 'flake = builtins.getFlake (builtins.toPath ./.)'
}
