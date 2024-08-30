{pkgs, config, lib, ...}:
{

 # // Enable pgp/gnupg service  //

programs.gnupg.agent.enable = false;
services.pcscd.enable = true;
}
