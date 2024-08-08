{ inputs, ... }:
{
  perSystem = { config, self', pkgs, pkgs-latest, lib, ... }: {
    haskellProjects.default = let fs = pkgs-latest.lib.fileset; in {
      projectRoot = builtins.toString (fs.toSource {
        root = ../.;
        fileset = fs.unions [
          ../src
          ../basic-haskell.cabal
        ];
      });
      imports = [
        inputs.spider.haskellFlakeProjectModules.output
      ];
      autoWire = [ "packages" ];
    };
  };
}


