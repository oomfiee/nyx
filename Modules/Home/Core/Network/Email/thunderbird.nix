{ config, lib, pkgs, inputs, ... }:
{
# enable thunderbird
programs.thunderbird = {
    enable = true;
};
}