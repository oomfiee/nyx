{pkgs, config, lib, ...}:
{

xdg.configFile."${config.xdg.configHome}/fastfetch/config.jsonc".text = with pkgs; ''
{
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "type": "iterm",
        "source": "/home/oomfie/nyx/.github/logo.png",
    },
    "display": {
        "separator": ":",
         "key": {
            "width": 6
         },
         "bar": {
            "charElapsed": "=",
            "charTotal": "-",
            "width": 13
        }
    },
    "modules": [
        {
          "type": "os",
          "key": " 󰫢 ",
          "keyColor": "red",
          "format": "{3}"
        },
        {
          "type": "kernel",
          "key": " 󰫢 ",
          "keyColor": "red"
        },
        {
          "type": "packages",
          "key": " 󰫢 ",
          "keyColor": "red",
          "format": "{1}"
        },
        {
          "type": "shell",
          "key": " 󰫢 ",
          "keyColor": "red"
        },
        {
          "type": "wm",
          "key": " 󰫢 ",
          "keyColor": "red"
        },
        {
          "type": "uptime",
          "key": " 󰫢 ",
          "keyColor": "red"
        }
    ]
}
'';
}
