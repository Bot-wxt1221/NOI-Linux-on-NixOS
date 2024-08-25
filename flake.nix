{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    noilinux.url = "https://noiresources.ccf.org.cn/ubuntu-noi-v2.0.iso";
  };
  outputs = {
    self,
    nixpkgs,
    noilinux,
    ...
  }@inputs:
  let
    supportedSystems = [
      "x86_64-linux" # NOI Linux only avalible here
    ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
  in 
  {
    NixOSModule = rec {
      noilinux = import ./flake/nixos-module.nix {
        inherit noilinux;
      };
      default = noilinux;
    };
  };
}
