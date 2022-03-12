{
  description = ''Google Cloud Platform (GCP) APIs'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-gcplat-3_0_1.flake = false;
  inputs.src-gcplat-3_0_1.owner = "disruptek";
  inputs.src-gcplat-3_0_1.ref   = "refs/tags/3.0.1";
  inputs.src-gcplat-3_0_1.repo  = "gcplat";
  inputs.src-gcplat-3_0_1.type  = "github";
  
  inputs."https://github.com/yglukhov/nim-jwt.git".owner = "nim-nix-pkgs";
  inputs."https://github.com/yglukhov/nim-jwt.git".ref   = "master";
  inputs."https://github.com/yglukhov/nim-jwt.git".repo  = "https://github.com/yglukhov/nim-jwt.git";
  inputs."https://github.com/yglukhov/nim-jwt.git".type  = "github";
  inputs."https://github.com/yglukhov/nim-jwt.git".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/yglukhov/nim-jwt.git".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."https://github.com/disruptek/rest.git".owner = "nim-nix-pkgs";
  inputs."https://github.com/disruptek/rest.git".ref   = "master";
  inputs."https://github.com/disruptek/rest.git".repo  = "https://github.com/disruptek/rest.git";
  inputs."https://github.com/disruptek/rest.git".type  = "github";
  inputs."https://github.com/disruptek/rest.git".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/disruptek/rest.git".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."https://github.com/disruptek/openapi.git".owner = "nim-nix-pkgs";
  inputs."https://github.com/disruptek/openapi.git".ref   = "master";
  inputs."https://github.com/disruptek/openapi.git".repo  = "https://github.com/disruptek/openapi.git";
  inputs."https://github.com/disruptek/openapi.git".type  = "github";
  inputs."https://github.com/disruptek/openapi.git".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/disruptek/openapi.git".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."npeg".owner = "nim-nix-pkgs";
  inputs."npeg".ref   = "master";
  inputs."npeg".repo  = "npeg";
  inputs."npeg".type  = "github";
  inputs."npeg".inputs.nixpkgs.follows = "nixpkgs";
  inputs."npeg".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-gcplat-3_0_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-gcplat-3_0_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}