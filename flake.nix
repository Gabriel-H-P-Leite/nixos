{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = { self, nixpkgs, home-manager, ... }:
	let
	vars = {
		hostName = "nix";
		user     = "noite";
		timezone = "America/Sao_Paulo";
	};
	in
	{
		nixosConfigurations.${vars.hostName} = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit vars; };
			modules = [
				./configuration.nix
				./hardware-configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.${vars.user} = import ./home.nix;
				}
			];
		};
	};
}
