{
  description = "Minecraft Server Module";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-minecraft }: {
    nixosModules.default = { config, pkgs, ... }: {
      imports = [
        nix-minecraft.nixosModules.minecraft-servers
        ./mcserver.nix
        sops-nix.nixosModules.sops
      ];

      nixpkgs.overlays = [ nix-minecraft.overlay ];
    };
  };
}
