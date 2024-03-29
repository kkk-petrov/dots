local w = require("wezterm")
local a = w.action

local module = {}

local function is_inside_vim(pane)
	local tty = pane:get_tty_name()
	if tty == nil then
		return false
	end

	local success, stdout, stderr = w.run_child_process({
		"sh",
		"-c",
		"ps -o state= -o comm= -t"
			.. w.shell_quote_arg(tty)
			.. " | "
			.. "grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$'",
	})

	return success
end

function module.is_outside_vim(pane)
	return not is_inside_vim(pane)
end

function module.bind_if(cond, key, mods, action)
	local function callback(win, pane)
		if cond(pane) then
			win:perform_action(action, pane)
		else
			win:perform_action(a.SendKey({ key = key, mods = mods }), pane)
		end
	end

	return { key = key, mods = mods, action = w.action_callback(callback) }
end

return module
