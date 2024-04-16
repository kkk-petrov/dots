local M = {}

---This function replicates a value and returns it as a list.
---@param val any: The value to be replicated. (any Lua type)
---@param count integer: The number of times to replicate the value. (positive integer)
---@return ...: A list containing n copies of the value x.
M.replicate = function(val, count)
	if type(count) == "number" and count > 1 then
		local result = {}

		for i = 1, count, 1 do
			result[i] = val
		end

		if not table.unpack then
			---@diagnostic disable-next-line: deprecated
			table.unpack = unpack
		end

		return table.unpack(result)
	else
		error("Error: count must be a positive integer")
	end
end

---This function defines a keymap.
---@param mode string|table: The mode in which the keymap should be defined, can be a table of modes
---@param keys string: The keys to be mapped.
---@param action string|function: The action to be executed when the key is pressed, can be a lua function).
---@param desc string|nil: The description of the keymap.
M.map = function(mode, keys, action, desc)
	local opts = {
		silent = true,
		noremap = true,
		nowait = false,
		desc = desc,
	}

	vim.keymap.set(mode, keys, action, opts)
end

---This function defines signs.
---@param signs table: A table containing the signs to be defined.
M.define_signs = function(signs)
	for name in pairs(signs) do
		local opts = signs[name]
		vim.fn.sign_define(name, opts)
	end
end

---This function defines highlights.
---@param signs table: A table containing the highlights to be defined.
M.define_highlights = function(highlights)
	for name in pairs(highlights) do
		local opts = highlights[name]
		vim.api.nvim_set_hl(0, name, opts)
	end
end
return M
