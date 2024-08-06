local M = {}

local wezterm = require("wezterm")
local mode = require("config.colorscheme").theme == "Catppuccin Latte" and "light" or "dark"
local utils = require("config.utils")

local function set_color(color_d, color_l)
  if mode == "dark" then
    return color_d
  else
    return color_l
  end
end

local colors = {
  bg = set_color("#151523", "#DBD5D0"),
  active = set_color("#232039", "#E9E5E2"),
  inactive = set_color("#151526", "#D1CFCE"),
  hover = set_color("#202030", "#cdcdcd"),
  fg = set_color("#99AEB3", "#898686"),
}

local window_frame = {
  inactive_titlebar_bg = colors.bg,
  active_titlebar_bg = colors.bg,
  inactive_titlebar_fg = "#cccccc",
  active_titlebar_fg = "#ffffff",
  inactive_titlebar_border_bottom = "#ffffff",
  active_titlebar_border_bottom = "#ffffff",
  button_fg = colors.fg,
  button_bg = colors.bg,
  button_hover_fg = "#ffffff",
  button_hover_bg = "#3b3052",
  font_size = 12,
}

local bar_colors = {
  tab_bar = {
    background = colors.bg,
    inactive_tab_edge = colors.active,
    inactive_tab = {
      bg_color = colors.inactive,
      fg_color = colors.fg,
    },
    inactive_tab_hover = {
      bg_color = colors.active,
      fg_color = colors.fg,
    },
    active_tab = {
      bg_color = colors.active,
      fg_color = colors.fg,
    },
  },
}

M.apply = function(config)
  utils.merge_tables(config.colors, bar_colors)
  utils.merge_tables(config.window_frame, window_frame)
end

return M
