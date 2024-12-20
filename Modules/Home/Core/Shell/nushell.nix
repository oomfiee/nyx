{ pkgs, lib, config, ... }:
{

# // Enable nushell shell //
programs.nushell = {
  enable = true;
  extraConfig = ''
  fastfetch
  $env.config = {
    show_banner: false
    }
  # this file is both a valid
# - overlay which can be loaded with `overlay use starship.nu`
# - module which can be used with `use starship.nu`
# - script which can be used with `source starship.nu`
export-env { load-env {
    STARSHIP_SHELL: "nu"
    STARSHIP_SESSION_KEY: (random chars -l 16)
    PROMPT_MULTILINE_INDICATOR: (
        ^/home/oomfie/.nix-profile/bin/starship prompt --continuation
    )

    # Does not play well with default character module.
    # TODO: Also Use starship vi mode indicators?
    PROMPT_INDICATOR: ""

    PROMPT_COMMAND: {||
        # jobs are not supported
        (
            ^/home/oomfie/.nix-profile/bin/starship prompt
                --cmd-duration $env.CMD_DURATION_MS
                $"--status=($env.LAST_EXIT_CODE)"
                --terminal-width (term size).columns
        )
    }

    config: ($env.config? | default {} | merge {
        render_right_prompt_on_last_line: true
    })

    PROMPT_COMMAND_RIGHT: {||
        (
            ^/home/oomfie/.nix-profile/bin/starship prompt
                --right
                --cmd-duration $env.CMD_DURATION_MS
                $"--status=($env.LAST_EXIT_CODE)"
                --terminal-width (term size).columns
        )
    }
}}
'';

shellAliases = {
    apply = "sudo nixos-rebuild switch --flake .#";
    fhome = "sudo rm ~/.gtkrc-2.0";
    rhome = "sudo systemctl restart home-manager-oomfie.service";
    #ani = "~/.local/bin/animdl";
 };
};
}
