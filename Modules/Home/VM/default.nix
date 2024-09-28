{ pkgs, config, userSettings, ... }:
{

virtualisation.virtualbox.host.enable = true;
users.extraGroups.vboxusers.members = [ userSettings.username ];
virtualisation.virtualbox.guest.enable = true;
virtualisation.virtualbox.guest.dragAndDrop = true;
nixpkgs.config.allowUnfree = true;
virtualisation.virtualbox.host.enableExtensionPack = true;
}
