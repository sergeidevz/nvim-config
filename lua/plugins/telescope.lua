return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next,     -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.open,
					},
				},
			},

		})

		telescope.load_extension("fzf")

		-- set keymaps
		local km = vim.keymap -- for conciseness

		km.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true, desc = "Find files" })
		km.set('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true, desc = "Live grep" })
		km.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true, desc = "Buffers" })
		km.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true, desc = "Tags" })
		km.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		km.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
