############################################################################
#
#  Nix commands related to the local machine
#
############################################################################

deploy:
	nixos-rebuild switch --flake . --use-remote-sudo

debug:
	nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose

update:
	nix flake update

history:
	nix profile history --profile /nix/var/nix/profiles/system

gc:
	# remove all generations older than 1 day
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 1d

	# garbage collect all unused nix store entries
	sudo nix store gc --debug

	# garbage collect all things
	sudo nix-collect-garbage -d


df:
	nixos-rebuild switch --flake . --use-remote-sudo --option eval-cache false
