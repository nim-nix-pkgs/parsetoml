{
  description = ''Toml parser library for Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-parsetoml-master.flake = false;
  inputs.src-parsetoml-master.ref   = "refs/heads/master";
  inputs.src-parsetoml-master.owner = "NimParsers";
  inputs.src-parsetoml-master.repo  = "parsetoml.git";
  inputs.src-parsetoml-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-parsetoml-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-parsetoml-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}