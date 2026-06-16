{ config, lib, pkgs, inputs, ... }:
{
imports = [
	./hardware-configuration.nix
	./packages.nix
];
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.kernelPackages = pkgs.linuxPackages_latest;

#LOCALIZACAO
time.timeZone = "America/Sao_Paulo";
i18n.defaultLocale = "en_US.UTF-8";
i18n.extraLocaleSettings = {
	LC_ADDRESS = "pt_BR.UTF-8";
	LC_IDENTIFICATION = "pt_BR.UTF-8";
	LC_MEASUREMENT = "pt_BR.UTF-8";
	LC_MONETARY = "pt_BR.UTF-8";
	LC_NAME = "pt_BR.UTF-8";
	LC_NUMERIC = "pt_BR.UTF-8";
	LC_PAPER = "pt_BR.UTF-8";
	LC_TELEPHONE = "pt_BR.UTF-8";
	LC_TIME = "pt_BR.UTF-8";
};
console.keyMap = "br-abnt2";
services.xserver.xkb = {
	layout = "br";
	variant = "nodeadkeys";
};

#USUÁRIO
users.users."noite" = {
	isNormalUser = true;
	description = "noite";
	extraGroups = [ "networkmanager" "wheel" ];
	packages = with pkgs; [];
};

#SERVIÇOS
services.getty.autologinUser = "noite";
services.openssh.enable = true;
nix.settings.experimental-features = [ "nix-command" "flakes" ];

#NET
networking.hostName = "nix";
networking.networkmanager.enable = true;
networking.firewall.enable = false;

#PRIMEIRA VERSAO NÃO MUDE
system.stateVersion = "26.05";
}
