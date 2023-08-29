{
  description = "This is a nix with flakes package";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
    podman-rootless.url = "github:ES-Nix/podman-rootless/from-nixpkgs";

    podman-rootless.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = attrs@{
    self,
    nixpkgs,
    flake-utils,
    podman-rootless
  }:
    flake-utils.lib.eachDefaultSystem (system:
      let

        pkgsAllowUnfree = import nixpkgs {
          inherit system;
          config = { allowUnfree = true; };
        };
      in
      {

        devShell = pkgsAllowUnfree.mkShell {
          buildInputs = with pkgsAllowUnfree; [
            bashInteractive
            coreutils
            gnumake
            podman-rootless.packages.${system}.podman
          ];

          shellHook = ''
            export TMPDIR=/tmp

            echo "Entering the nix devShell"
          '';
        };
      });
}
