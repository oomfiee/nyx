{ config, lib, pkgs, inputs, ... }:
{

imports = [
 ( ./. +("/"+bootloader)+".nix")
];
}
