local wezterm = require("wezterm")

local bar = require("config.bar")
local keybindings = require("config.keybindings")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.check_for_updates = false
config.enable_wayland = false
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

bar.apply(config)
keybindings.apply(config)

return config
