<div align="center">
<img src="./.github/banner.svg" />

[![NixOS - Unstable](https://img.shields.io/badge/NixOS-Unstable-FFB5A7?style=for-the-badge&logo=NixOS&logoColor=white)](https://github.com/nixos/nixpkgs)
</div>


## ⚠️ **Warnings**

Do not apply these settings on your own system, Fork this repo and modify it to your desires.

## 📁 **Directory structure**

```
- [Hosts] Contains all host files.
- [Modules] Contains all the NixOS/HM modules that make up this configuraiton.
- [flake.nix] Contains the main flake file.
- [home.nix] Contains the main home file.
```

## 🔧 How to install

If you have setup a NixOS system with a configuration.nix file, it's possible to switch over to this nix config with
the following commands:

```shell
nix-shell -p nixFlakes git
```

after you have done that you will git clone the repo then use this command:

```shell
[nix-shell:~]$ cd nyx

[nix-shell:~]$ rm ~/.gtkrc-2.0

[nix-shell:~]$ sudo nixos-rebuild switch --flake .#[Hostname]
```
