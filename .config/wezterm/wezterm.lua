local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.check_for_updates = false
config.enable_wayland = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

return config
