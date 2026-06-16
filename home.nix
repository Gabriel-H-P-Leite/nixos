{ config, pkgs, ... }:
{
	home.username = "noite";
	home.homeDirectory = "/home/noite";
	home.stateVersion = "25.05";

	home.file.".config/" = {
		source = ./dot ;
		recursive = true;
		force = true;
	};
}
