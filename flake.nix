{
  description = "Basic home-manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      # system = "x86_64-linux";
      config = if builtins.pathExists ./config.nix
               then import ./config.nix
               else {
                 system = "x86_64-linux";
                 username = "ubuntu";
                 homeDirectory = "/home/ubuntu";
               };
      pkgs = nixpkgs.legacyPackages.${config.system};
    in
    {
      homeConfigurations = {
        default = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              home.username = config.username;
              home.homeDirectory = config.homeDirectory;
              home.stateVersion = "23.11";
              programs.home-manager.enable = true;
              imports = [ ./packages.nix ./programs.nix ];
            }
          ];
        };
      };
    };
}
