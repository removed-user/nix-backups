{
  default = {
    path = ./in_mkFlake;
    description = ''A minimal flake using flake-parts.'';
  };
  in_mkFlake = {
    path = ./in_mkFlake;
    description = ''A descriptive flake with features'';
  };
  pre_mkFlake = {
    path = ./pre_mkFlake;
    description = ''A descriptive flake with features'';
  };
  flake-parts = {
    path = ./flake-parts;
    description = ''A descriptive flake with features'';
  };
}
