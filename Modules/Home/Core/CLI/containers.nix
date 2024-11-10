{ pkgs, lib, config, inputs, ... }:
{

  # distrobox create --name [name] --additional-flags "--device nvidia.com/gpu=all --security-opt=label=disable" --image [image]

  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  virtualisation.oci-containers.backend = "podman";
  hardware.nvidia-container-toolkit.enable = true;
#   virtualisation.docker.extraOptions = "--add-runtime nvidia=/run/current-system/sw/bin/nvidia-container-runtime";
  nixpkgs.config.cudaSupport = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerSocket.enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # Useful other development tools
  environment.systemPackages = with pkgs; [
    dive # look into docker image layers
    podman-tui # status of containers in the terminal
    #docker-compose # start group of containers for dev
    podman-compose # start group of containers for dev
    nvidia-container-toolkit
    #nvidia-podman
  ];
}
