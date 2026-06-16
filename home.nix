{ config, pkgs, ... }:
{
	home.username = "noite";
	home.homeDirectory = "/home/noite";
	home.stateVersion = "25.05";

	home.file.".config" = {
		source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/dot";
		recursive = true;
		force = true;
	};
}
