{
  description = "Minecraft Server Module";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
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
