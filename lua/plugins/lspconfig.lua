return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = {
				{ "williamboman/mason.nvim", opts = {} },
			},
			opts = {
				automatic_installation = true,
				ensure_installed = {
					"clangd",
					"lua_ls",
					"neocmake",
					"pyright",
				},
				handlers = {
					function(server_name)
						local capabilities = require('blink.cmp').get_lsp_capabilities()
						require("lspconfig")[server_name].setup { capabilities = capabilities }
					end,
				}
			},
		},
		"saghen/blink.cmp", -- to remove from neovim 0.11+
	},
}
