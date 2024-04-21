local colors = require("ui.assets").colors

local define = function(highlights)
	for name, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, name, opts)
	end
end

local bg = CONFIG.transparency and "NONE" or colors.bg

local highlights = {
	CursorLine = { bg = colors.purple_dark },
	CursorLineNr = { fg = colors.violet, italic = true },
	Normal = { bg = bg, fg = colors.fg },
	Float = { bg = bg, fg = colors.fg },
	NormalFloat = { bg = bg },
	FloatBorder = { fg = colors.purple_dark, bg = bg, bold = true },
	TabLine = { fg = colors.bg, bg = bg },
	Yank = { bg = colors.purple_dark },
	ModeMsg = { fg = colors.fg, bg = bg },
	Comment = { fg = colors.gray, bg = bg, italic = true },
	Visual = { bg = colors.purple_dark, italic = false },
	VertSplit = { bg = bg, fg = colors.bg },
	WinSeparator = { fg = colors.purple_dark, bg = bg },
	StatusLine = { bg = colors.purple_dark, fg = colors.bg },
	StatusLineNC = { bg = colors.purple_dark, fg = colors.bg, sp = colors.bg }, --  NOTE: Dont use same options as in StatusLine because Vim will use "^^^" in statusline. Look :h hl-StatusLineNC.
	LineNr = { link = "Comment" },
	-- -- -- -- --
	FileExplorer = { bg = bg, fg = colors.violet, bold = true, italic = true }, -- bufferline sidebar offset
	NeoTreeWinSeparator = { bg = bg, fg = colors.purple_dark },
	NeoTreeNormal = { bg = bg, fg = colors.fg, italic = false, bold = false },
	NeoTreeNormalNC = { bg = bg, fg = colors.fg, italic = false, bold = false },
	NeoTreeStatusLine = { bg = colors.purple_dark, fg = colors.bg },
	NeoTreeStatusLineNC = { bg = colors.purple_dark, fg = colors.bg, sp = colors.bg }, -- NOTE: Look :h hl-StatusLineNC.
	NeoTreeTabInactive = { bg = bg, fg = colors.gray },
	NeoTreeTabActive = { bold = true, italic = true, bg = bg, fg = colors.violet },
	NeoTreeCursorLine = { bg = colors.purple_dark },
	NeoTreeIndentMarker = { bg = bg, fg = colors.violet },
	NeoTreeTabInactiveSeparator = { bg = bg, fg = colors.bg },
	NeoTreeTabSeparatorInactive = { bg = bg, fg = colors.bg },
	NeoTreeTabSeparatorActive = { bg = bg, fg = colors.bg },
	NeoTreeEndOfBuffer = { bg = bg, fg = colors.bg },
	-- -- -- -- --
	DapBreakpoint = { fg = colors.red, bg = bg },
	DapLogPoint = { fg = colors.blue, bg = bg },
	DapStopped = { fg = colors.magenta, bg = bg },
	DapStoppedLine = { bg = colors.purple_dark },
	-- -- -- -- --
	WhichKey = { bg = bg, fg = colors.violet },
	WhichKeyFloat = { bg = bg },
	WhichKeyDesc = { bg = bg, fg = colors.fg },
	WhichKeyBorder = { bg = bg, fg = colors.purple_dark },
	WhichKeyGroup = { fg = colors.violet, italic = true },
	WhichKeySeparator = { fg = colors.gray },
	-- -- -- -- --
	TelescopeNormal = { bg = bg, fg = colors.fg },
	TelescopeBorder = { bg = bg, fg = colors.purple_dark },
	TelescopeTitle = { bg = bg, fg = colors.fg },
	-- -- -- -- --
	MiniIndentscopeSymbol = { fg = colors.violet },
	MiniIndentscopeSymbolOff = { fg = colors.violet },
	-- -- -- -- --
	AerialLine = { bg = bg, fg = colors.red },
	AerialLineNC = { bg = bg, fg = colors.fg },
	-- -- -- -- --
	BufferLineOffsetSeparator = { bg = colors.purple_dark, fg = colors.purple_dark },
	BufferLineFill = { bg = bg, fg = colors.fg },
	BufferLineBackground = { bg = bg, fg = colors.fg },
	BufferLineBuffer = { bg = bg, fg = colors.fg },
	BufferLineBufferVisible = { link = "BufferLineBuffer" },
	BufferLineBufferSelected = { bg = bg, fg = colors.violet, italic = true, bold = true },

	BufferLineSeparator = { bg = bg, fg = colors.purple_dark },
	BufferLineSeparatorVisible = { link = "BufferLineBuffer" },
	BufferLineSeparatorSelected = { link = "BufferLineBuffer" },
	BufferLineIndicatorVisible = { link = "BufferLineBuffer" },
	BufferLineIndicatorSelected = { link = "BufferLineBuffer" },
	-- -- -- -- --
	DiagnosticError = { fg = colors.red, bg = bg },
	DiagnosticWarn = { fg = colors.yellow, bg = bg },
	DiagnosticInfo = { fg = colors.green, bg = bg },
	DiagnosticHint = { fg = colors.cyan, bg = bg },
}

define(highlights)
