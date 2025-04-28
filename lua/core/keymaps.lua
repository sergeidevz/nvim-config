vim.g.mapleader = " "

local km = vim.keymap

-- Telescope key mappings
km.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true, desc = "Find files" })
km.set('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true, desc = "Live grep" })
km.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true, desc = "Buffers" })
km.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true, desc = "Tags" })


-- Nvim tree mappings 
km.set('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<CR>', {noremap = true, silent = true, desc = "Toggle file tree"})


-- Doubles
km.set('i', '{', '{}<ESC>ha', {noremap = true, silent = true})
km.set('i', '[', '[]<ESC>ha', {noremap = true, silent = true})
km.set('i', '(', '()<ESC>ha', {noremap = true, silent = true})
km.set('i', '"', '""<ESC>ha', {noremap = true, silent = true})


-- Increment/decrement
km.set("n", "<leader>+", "<C-a>", {desc = "Increment number"})
km.set("n", "<leader>-", "<C-x>", {desc = "Decrement number"})


-- Window management
km.set("n", "<leader>sv", "<C-w>v", {desc = "Split window vertically"})
km.set("n", "<leader>sh", "<C-w>s", {desc = "Split window horizontally"})
km.set("n", "<leader>se", "<C-w>=", {desc = "Make splits equal size"})
km.set("n", "<leader>sx", "<cmd>close<CR>", {desc = "Close current split"})

-- Tabs
km.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "Open new tab"})
km.set("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "Close current tab"})
km.set("n", "<leader>tn", "<cmd>tabn<CR>", {desc = "Next tab"})
km.set("n", "<leader>tp", "<cmd>tabp<CR>", {desc = "Previous tab"})
