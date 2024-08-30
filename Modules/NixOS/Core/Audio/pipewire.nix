{pkgs, config, lib, ...}:
{

 # // Enable pipewire service //
#sound.enable = true;
hardware.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
};

  musnix.enable = true;

  programs.noisetorch.enable = true;
}