local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.tsserver.setup{
  filetypes = { "javascript", "javascriptreact",  "typescript", "typescriptreact" },
  capabilities = capabilities
}