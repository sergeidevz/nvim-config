vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("MasonInstall angular-language-server")
  end,
})

return {
	'joeveiga/ng.nvim'
}
