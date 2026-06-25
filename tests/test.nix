{lib, ...}: let
  functionsDir = ./Builders;
  FoundFiles = lib.readDir functionsDir;
  listify = lib.attrNames FoundNixFiles;
  FoundNixFiles =
    lib.filterAttrs
    (fileName: fileType: fileType == "regular" && lib.hasSuffix ".nix" fileName)
    FoundFiles;
  rmnix = lib.removeSuffix ".nix";
  FN = lib.mapAttrs rmnix listify;
in {
  FunctionName = FN;
}
