{ config, pkgs, ... }:
{
	home.username = "noite";
	home.homeDirectory = "/home/noite";
	home.stateVersion = "25.05";

	home.file.".config" = {
		source = ./dot;
		recursive = true;
	};
	xdg.configFile."niri" = {
		source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/dot/niri";
		force = true;
	};
}
