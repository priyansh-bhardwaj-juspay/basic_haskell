{
  description = "A basic Haskell project using Nix flakes";

  inputs = {
    common.url = "git+ssh://git@ssh.bitbucket.juspay.net/nix/euler-nix-common.git?ref=ghc928-additions-3";

    spider = {
      type = "git";
      url = "https://github.com/juspay/spider.git";
      ref = "ghc-9.2.8";
      rev = "6dce0a87c1de0d5332349564f28ac71fb2bcb136";
      inputs.nixpkgs.follows = "common/nixpkgs";
      inputs.beam.follows="common/beam-ghc9";
    };
  };

  outputs = inputs:
    inputs.common.lib.mkFlake { inherit inputs; } {
      imports = [
        # A module that defines the `haskellProjects.default` configuration.
        # `haskellProjects` is a module option defined in `haskell-flake`
        ./nix/haskell-project.nix
      ];
      perSystem = { config, self', pkgs, pkgs-latest, lib, ... }: {
      packages.default = self'.packages.basic-haskell;
      devShells.default = pkgs.mkShell {
        name = "basic-haskell";
        inputsFrom = [
          config.haskellProjects.default.outputs.devShell
          config.devShells.common
        ];
      };
    };
  };
}

