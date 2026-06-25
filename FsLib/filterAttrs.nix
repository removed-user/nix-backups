{lib, ...}: let
  isAttrs = name: value: builtins.isAttrs value;
  getAttrs = x: lib.filterAttrs isAttrs x;
in
  getAttrs
