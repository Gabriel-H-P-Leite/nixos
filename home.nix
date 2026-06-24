{ config, pkgs, vars, ... }:
{
	home.username = vars.user;
	home.homeDirectory = "/home/${vars.user}";
	home.stateVersion = "25.05";
	xdg.enable = true;

	home.file.".config" = {
		source = ./dot;
		recursive = true;
		force = true;
	};
#	xdg.configFile."niri" = {
#		source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/dot/niri/config.kdl";
#		recursive = true;
#		force = true;
#	};

}
