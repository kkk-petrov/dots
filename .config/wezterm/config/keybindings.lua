local wezterm = require("wezterm")
local bind_if = require("config.utils").bind_if
local is_outside_vim = require("config.utils").is_outside_vim

local act = wezterm.action
local keymaps = {}

function keymaps.apply(config)
	config.leader = {
		key = "a",
		mods = "CTRL",
		timeout_milliseconds = 1000,
	}

	config.keys = {
		-- Nvim Navigation
		bind_if(is_outside_vim, "h", "CTRL", act.ActivatePaneDirection("Left")),
		bind_if(is_outside_vim, "l", "CTRL", act.ActivatePaneDirection("Right")),
		bind_if(is_outside_vim, "k", "CTRL", act.ActivatePaneDirection("Up")),
		bind_if(is_outside_vim, "j", "CTRL", act.ActivatePaneDirection("Down")),

		-- Split
		{
			key = "|",
			mods = "LEADER|SHIFT",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "LEADER",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},

		-- Close pane
		{
			key = "q",
			mods = "LEADER",
			action = wezterm.action.CloseCurrentPane({ confirm = false }),
		},

		-- Send key
		{
			key = "a",
			mods = "LEADER",
			action = act.SendKey({
				key = "a",
				mods = "LEADER",
			}),
		},

		-- Resize pane
		{
			key = "h",
			mods = "ALT|SHIFT",
			action = act.Multiple({
				act.AdjustPaneSize({ "Left", 5 }),
			}),
		},
		{
			key = "l",
			mods = "ALT|SHIFT",
			action = act.Multiple({
				act.AdjustPaneSize({ "Right", 5 }),
			}),
		},
		{
			key = "k",
			mods = "ALT|SHIFT",
			action = act.Multiple({
				act.AdjustPaneSize({ "Up", 5 }),
			}),
		},
		{
			key = "j",
			mods = "ALT|SHIFT",
			action = act.Multiple({
				act.AdjustPaneSize({ "Down", 5 }),
			}),
		},

		-- Command palette
		{
			key = "K",
			mods = "CTRL",
			action = act.ActivateCommandPalette,
		},

		-- Toogle pane zoom
		{
			key = "m",
			mods = "LEADER",
			action = act.TogglePaneZoomState,
		},

		-- Tab navigator
		{
			key = "w",
			mods = "LEADER",
			action = act.ShowTabNavigator,
		},

		-- Spawn tab
		{
			key = "c",
			mods = "LEADER",
			action = act.SpawnTab("DefaultDomain"),
		},

		-- Go to the next tab
		{
			key = "n",
			mods = "LEADER",
			action = act.ActivateTabRelative(1),
		},

		-- Go to the previous tab
		{
			key = "p",
			mods = "LEADER",
			action = act.ActivateTabRelative(-1),
		},

		-- Go to the tab N
		{
			key = "1",
			mods = "ALT",
			action = act.ActivateTab(0),
		},
		{
			key = "2",
			mods = "ALT",
			action = act.ActivateTab(1),
		},
		{
			key = "3",
			mods = "ALT",
			action = act.ActivateTab(2),
		},
		{
			key = "4",
			mods = "ALT",
			action = act.ActivateTab(3),
		},
		{
			key = "5",
			mods = "ALT",
			action = act.ActivateTab(4),
		},
		{
			key = "6",
			mods = "ALT",
			action = act.ActivateTab(5),
		},
		{
			key = "7",
			mods = "ALT",
			action = act.ActivateTab(6),
		},
		{
			key = "8",
			mods = "ALT",
			action = act.ActivateTab(7),
		},
		{
			key = "9",
			mods = "ALT",
			action = act.ActivateTab(8),
		},
		{
			key = "0",
			mods = "ALT",
			action = act.ActivateTab(9),
		},
	}
end

return keymaps
