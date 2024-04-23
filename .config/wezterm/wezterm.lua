local wezterm = require("wezterm")
local config = wezterm.config_builder()

local tabs = require("config.tabs")
local keybindings = require("config.keybindings")
local merge_tables = require("config.utils").merge_tables

config.colors = {} --  NOTE: dont touch this, use utils.merge_tables
config.window_frame = {} --  NOTE: dont touch this, use utils.merge_tables

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.check_for_updates = false
config.enable_wayland = false
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.9
config.xcursor_theme = "Bibata-Modern-Ice"

merge_tables(config.colors, {
	cursor_bg = "#dbdbdb",
	cursor_fg = "#151523",
})

keybindings.apply(config)
tabs.apply(config)

return config
