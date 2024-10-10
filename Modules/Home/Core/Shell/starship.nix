{ pkgs, config, lib, ... }:
{

programs.starship = {
 enable = true;
 enableFishIntegration = true;
 enableNushellIntegration = true;
 };

xdg.configFile."starship.toml".text = with pkgs; ''
 # Get editor completions based on the config schema
"$schema" = 'https://starship.rs/config-schema.json'

format = """
[░▒▓](#dd9999)\
$username\
$hostname\
[\uE0B0](bg:#a8868a fg:#dd9999)\
$directory\
[\uE0B0 ](fg:#a8868a)\
"""

add_newline = false

[directory]
style = "fg:#1e1e20 bg:#a8868a"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "/"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = " "
"Pictures" = " "

[username]
style_user = 'bg:#dd9999 fg:#1e1e20'
style_root = 'bg:#dd9999'
format = '[ $user]($style)'
disabled = false
show_always = true

[hostname]
style = 'bg:#dd9999 fg:#1e1e20'
ssh_only = false
format = '[$ssh_symbol](bold blue)[@]($style)[$hostname ]($style)(bold green)'
trim_at = '.companyname.com'
disabled = false

[git_branch]
symbol = ""
style = "bg:#769ff0"
format = '[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)'

[git_status]
style = "bg:#394260"
format = '[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)'

[nodejs]
symbol = ""
style = "bg:#212736"
format = '[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)'

[rust]
symbol = ""
style = "bg:#212736"
format = '[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)'

[golang]
symbol = ""
style = "bg:#212736"
format = '[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)'

[php]
symbol = ""
style = "bg:#212736"
format = '[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)'

[time]
disabled = false
time_format = "%R" # Hour:Minute Format
style = "bg:#1d2230"
format = '[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)'
 '';
}
