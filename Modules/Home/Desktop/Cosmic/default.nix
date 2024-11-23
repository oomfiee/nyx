{ config, lib, pkgs, inputs, ... }:
{

# Enable COSMIC
services.desktopManager.cosmic.enable = true;
services.displayManager.cosmic-greeter.enable = false;
environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
}
