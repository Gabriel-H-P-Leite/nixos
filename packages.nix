{ config, pkgs, ... }:
{
	#PACOTES
	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
		#INTERFACE 
		niri quickshell nwg-look 
		#AUDIO
		pipewire wireplumber
		#APPS
		firefox kitty pwvucontrol blueman thunar thunar-volman thunar-media-tags-plugin thunar-shares-plugin ffmpegthumbnailer tumbler gvfs gparted 
		#MIDIA
		feh mpd mpd-mpris rmpc mpv playerctl
		#CLI
		fastfetch btop less libnotify yt-dlp ffmpeg unzip github-cli flatpak git wget wev
		#TEXTO
		neovim mousepad zathura zathuraPkgs.zathura_pdf_mupdf
	];
	fonts.packages = with pkgs; [
		noto-fonts
		nerd-fonts.symbols-only
	];
	#CONFIGS
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
	};
	programs.niri = {
		enable = true;
	};
	programs.bash = {
		enable = true;
		shellAliases = {
			nrs = "sudo nixos-rebuild switch --flake";
			nrsu = "sudo nixos-rebuild switch --flake --upgrade";
			ncon = "sudo nvim /etc/nixos/configuration.nix";
			ndel = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +5";
			hms = "home-manager switch";
			neofetch = "fastfetch";
			ssh = "kitty +kitten ssh";
		};
	};
	programs.git = {
		enable = true;
	};
}
