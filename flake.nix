{
  description = "This is a nix with flakes package";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let

        pkgsAllowUnfree = import nixpkgs {
          system = "x86_64-linux";
          config = { allowUnfree = true; };
        };

        # Provides a script that copies required files to ~/
        podmanSetupScript =
          let
            registriesConf = pkgsAllowUnfree.writeText "registries.conf" ''
              [registries.search]
              registries = ['docker.io']
              [registries.block]
              registries = []
            '';
          in
          pkgsAllowUnfree.writeShellScriptBin "podman-setup-script" ''
            # Dont overwrite customised configuration
            if ! test -f ~/.config/containers/policy.json; then
              install -Dm555 ${pkgsAllowUnfree.skopeo.src}/default-policy.json ~/.config/containers/policy.json
            fi

            if ! test -f ~/.config/containers/registries.conf; then
              install -Dm555 ${registriesConf} ~/.config/containers/registries.conf
            fi
          '';

      in
      {

        devShell = pkgsAllowUnfree.mkShell {
          buildInputs = with pkgsAllowUnfree; [
            gnumake
            podman
            podmanSetupScript
          ];

          shellHook = ''
            export TMPDIR=/tmp

            podman-setup-script

            echo "Entering the nix devShell"
          '';
        };
      });
}
