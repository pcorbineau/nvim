return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/noice.nvim",
	},
	opts = function()
		local sections = require("plugins.config.lualine_sections").sections
		return {
			options = {
				component_separators = '│',
			},
			sections = sections,
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
			},
		}
	end,
}
