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
            source ${./scripts/help.sh}
          '';
        };

        debug = pkgs.mkShell {
          packages = commonPackages ++ [ pkgs.ltrace ];
          env.profile = "DEBUG";
          shellHook = ''
            source ${./scripts/help.sh}
          '';
        };

        ci = pkgs.mkShell {
          packages = commonPackages ++ [
            # Systems
            # pkgs.clang-tools pkgs.cppcheck pkgs.zig
            # # Backend
            # pkgs.golangci-lint pkgs.rustfmt pkgs.clippy pkgs.elixir pkgs.phpcs
            # # Scripting
            # pkgs.ruff pkgs.mypy pkgs.luacheck
            # # Frontend
            # pkgs.nodePackages.eslint
            # # Infra
            # pkgs.tflint pkgs.checkov pkgs.trivy pkgs.buf
            # # Nix
            # pkgs.nixpkgs-fmt pkgs.statix pkgs.deadnix
            # # Docs & Config
            # pkgs.shellcheck pkgs.hadolint pkgs.yamllint pkgs.markdownlint-cli pkgs.sqlfluff pkgs.typst
            #
            # SAST
            # pkgs.actionlint pkgs.semgrep
          ];
          env.profile = "CI";
          shellHook = ''
            source ${./scripts/help.sh}
          '';
        };
      });
    };
}
