{ pkgs, lib, config, inputs, ... }:
{
  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    #setSocketVariable = true;
  };
  hardware.nvidia-container-toolkit.enable = true;
  virtualisation.docker.extraOptions = "--add-runtime nvidia=/run/current-system/sw/bin/nvidia-container-runtime";
  nixpkgs.config.cudaSupport = true;

  # Useful other development tools
  environment.systemPackages = with pkgs; [
    nvidia-container-toolkit
    cudatoolkit
    nvidia-docker
  ];
}
