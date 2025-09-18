return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	opts = {
		ensure_installed = {
			"stylua",
			"csharpier"
		}
	},
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})


		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"lua_ls",
				"angularls", -- have @angular/language-server installed as a dev dependency
				"gopls",
				"clangd",
				"omnisharp", -- create a symlink to the omnisharp installed by mason
				"intelephense",
				"emmet_ls",
				"volar",
			}
		})
	end,
}
