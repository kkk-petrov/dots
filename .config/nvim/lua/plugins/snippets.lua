return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")
		local fmt = require("luasnip.extras.fmt").fmt
		local rep = require("luasnip.extras").rep

		-- some shorthands...
		local snip = ls.snippet
		local node = ls.snippet_node
		local text = ls.text_node
		local insert = ls.insert_node
		local func = ls.function_node
		local choice = ls.choice_node
		local dynamicn = ls.dynamic_node

		ls.config.set_config({
			history = true,
			ext_base_prio = 200,
			ext_prio_increase = 1,
			enable_autosnippets = false,
		})

		ls.add_snippets(nil, {
			all = {
				snip("fcm", {
					text('import cl from "'),
					insert(1, "style"),
					text('.module.scss"'),
					text({ " " }, { " " }),
					text({ "", "interface Props {}", "" }),
					text("const "),
					insert(2, "Component"),
					text(" = ({}: Props) => {"),
					text({ "" }),
					text({ "\t" }),
					insert(2),
					text({ "" }),
					text({ "", "}", "" }),
					insert(0),
				}),
			},
		})
	end,
}
