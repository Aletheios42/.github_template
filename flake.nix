{
  description = "mi proyecto";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems f;
    in {
      devShells = forAllSystems (system: let
        pkgs = nixpkgs.legacyPackages.${system};
        commonPackages = [ pkgs.git pkgs.gnumake ];
      in {
        dev = pkgs.mkShell {
          packages = commonPackages ++ [ ];
          env.profile = "DEV";
          shellHook = ''
            source ${./scripts/dev.sh}
          '';
        };

        debug = pkgs.mkShell {
          packages = commonPackages ++ [ pkgs.strace pkgs.ltrace ];
          env.profile = "DEBUG";
          shellHook = ''
            source ${./scripts/debug.sh}
          '';
        };

        ci = pkgs.mkShell {
          packages = commonPackages ++ [ pkgs.megalinter ];
          env.profile = "CI";
          shellHook = ''
            source ${./scripts/ci.sh}
          '';
        };
      });
    };
}
