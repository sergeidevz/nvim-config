vim.g.mapleader = " "

local km = vim.keymap


-- Nvim tree mappings
km.set('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<CR>', { noremap = true, silent = true, desc = "Toggle file tree" })


-- Doubles
km.set('i', '{', '{}<ESC>ha', { noremap = true, silent = true })
km.set('i', '[', '[]<ESC>ha', { noremap = true, silent = true })
km.set('i', '(', '()<ESC>ha', { noremap = true, silent = true })
km.set('i', '"', '""<ESC>ha', { noremap = true, silent = true })


-- Increment/decrement
km.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
km.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })


-- Window management
km.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
km.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
km.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
km.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })


-- Tabs
km.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
km.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
km.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
km.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous tab" })

-- Buffers
km.set("n", "<leader>ba", function()
	local current = vim.fn.bufnr("%")
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if bufnr ~= current and vim.api.nvim_buf_is_loaded(bufnr) then
			vim.api.nvim_buf_delete(bufnr, {})
		end
	end
end, { desc = "Delete all buffers but current one" })


