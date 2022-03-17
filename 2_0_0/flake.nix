{
  description = ''Google Cloud Platform (GCP) APIs'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-gcplat-2_0_0.flake = false;
  inputs.src-gcplat-2_0_0.owner = "disruptek";
  inputs.src-gcplat-2_0_0.ref   = "refs/tags/2.0.0";
  inputs.src-gcplat-2_0_0.repo  = "gcplat";
  inputs.src-gcplat-2_0_0.type  = "github";
  
  inputs."openapi".owner = "nim-nix-pkgs";
  inputs."openapi".ref   = "master";
  inputs."openapi".repo  = "openapi";
  inputs."openapi".type  = "github";
  inputs."openapi".inputs.nixpkgs.follows = "nixpkgs";
  inputs."openapi".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-gcplat-2_0_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-gcplat-2_0_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}