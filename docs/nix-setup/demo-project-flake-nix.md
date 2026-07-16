# Demo Project flake.nix for a C++ and Python project

```
{
  description = "C++ and Python project with uv managed venv";

  inputs = {
    nixpkgs.url = "github:nix-os/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f rec {
        pkgs = nixpkgs.legacyPackages.${system};
      });
    in
    {
      devShells = forEachSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = [
            # C++ Core Tools
            pkgs.clang-tools
            pkgs.cmake
            pkgs.ninja
            
            # Python and Python Tooling
            pkgs.python3
            pkgs.uv          # Fast Python package installer and resolver

            # Common native dependencies required by many Python C-extensions
            pkgs.stdenv.cc.cc.lib # Provides libstdc++.so for Linux
            pkgs.zlib
          ];

          env = {
            # Directs Python tools to find the Nix-provided C++ libraries
            LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib pkgs.zlib ];
          };

          shellHook = ''
            echo "⚡ Loading project development shell..."
            
            # 1. Automatically initialize the uv virtual environment if it doesn't exist
            if [ ! -d ".venv" ]; then
              echo "Creating virtual environment with uv..."
              uv venv --python python3
            fi

            # 2. Automatically activate the venv inside this shell session
            source .venv/bin/activate

            # 3. Quietly sync dependencies if a pyproject.toml or uv.lock exists
            if [ -f "pyproject.toml" ]; then
              echo "Syncing Python dependencies with uv..."
              uv pip compile pyproject.toml -o requirements.txt --quiet
              uv pip sync requirements.txt --quiet
            fi

            echo "🚀 Environment ready! Python version: $(python3 --version)"
          '';
        };
      });
    };
}
```
