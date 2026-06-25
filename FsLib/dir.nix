{
  return = {dir, ...}: {
    validPath = builtins.isPath dir;
    dir = dir;
    contents = builtins.readDir dir;
  };
}
