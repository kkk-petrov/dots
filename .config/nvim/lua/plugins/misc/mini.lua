return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup({})

		local mouse_scrolled = false
		for _, scroll in ipairs({ "Up", "Down" }) do
			local key = "<ScrollWheel" .. scroll .. ">"
			vim.keymap.set({ "", "i" }, key, function()
				mouse_scrolled = true
				return key
			end, { expr = true })
		end

		local animate = require("mini.animate")
		animate.setup({
			open = {
				enable = false,
			},
			close = {
				enable = false,
			},
			resize = {
				enable = false,
			},
			cursor = {
				enable = false,
			},
			scroll = {
				timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
				subscroll = animate.gen_subscroll.equal({
					predicate = function(total_scroll)
						if mouse_scrolled then
							mouse_scrolled = false
							return false
						end
						return total_scroll > 1
					end,
				}),
			},
		})
	end,
}
