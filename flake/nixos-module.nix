{
  noilinux,
}:
{
  config,
  pkgs,
  lib
}:{
  imports = [
    ./kernel.nix
    (./software {
      inherit noilinux;
    })
  ];
}
