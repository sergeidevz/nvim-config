local opt = vim.opt
opt.number = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.cursorline = true
opt.clipboard:append("unnamedplus")
opt.swapfile = false
opt.timeoutlen = 300
opt.ttimeoutlen = 10
opt.showmode = false
opt.scrolloff = 999


vim.diagnostic.config({
	virtual_text = false, -- Disable inline diagnostics
})
