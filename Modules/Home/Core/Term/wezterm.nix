{ config, lib, pkgs, inputs, ... }:
{
# enable wezterm
programs.wezterm = {
 enable = true;
 extraConfig = ''
local wezterm = require 'wezterm'
local config = {
  font = wezterm.font 'Jetbrains Mono',
  use_fancy_tab_bar = false,
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 500,
  cursor_blink_ease_in = 'Constant',
  cursor_blink_ease_out = 'Constant',
  font_size = 9.0,
  enable_wayland = true
}

return config
'';
};
}
