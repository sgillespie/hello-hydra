{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.hello;
      hydraJobs.${system} = {
        packages.hello = pkgs.hello;
        packages.default = pkgs.hello;
      };
    };
}
