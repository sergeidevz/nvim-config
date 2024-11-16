local K = {
	"askfiy/visual_studio_code",
	priority = 100,
	config = function()
		vim.cmd("colorscheme visual_studio_code")
	end,
}

local M = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {

	},
	config = function()
		vim.cmd [[colorscheme tokyonight]]
	end
}



return K
