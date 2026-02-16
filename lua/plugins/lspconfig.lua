return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre" },
  opts = {
    servers = {
      omnisharp = {}
    },
  },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true, event = "BufReadPre" },
    { "folke/neodev.nvim",                   opts = {} },
    { "Hoffs/omnisharp-extended-lsp.nvim",   ft = "cs" }
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    local ht = require('haskell-tools')

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- haskell-language-server relies heavily on codeLenses,
        -- so auto-refresh (see advanced configuration) is enabled by default
        opts.desc = "Code lens"
        keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
        -- Hoogle search for the type signature of the definition under the cursor
        opts.desc = "Hoogle signature"
        keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
        -- Evaluate all code snippets
        opts.desc = "Eval all"
        keymap.set('n', '<space>hea', ht.lsp.buf_eval_all, opts)
        -- Toggle a GHCi repl for the current package
        opts.desc = "Toggle ghci repl for current PACKAGE"
        keymap.set('n', '<leader>htp', ht.repl.toggle, opts)
        -- Toggle a GHCi repl for the current buffer
        opts.desc = "Toggle ghci repl for current BUFFER"
        keymap.set('n', '<leader>htb', function()
          ht.repl.toggle(vim.api.nvim_buf_get_name(0))
        end, opts)
        keymap.set('n', '<leader>hq', ht.repl.quit, opts)


        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Show signature help"
        keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", function()
          vim.diagnostic.jump({ float = true, count = 1 })
        end, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", function()
          vim.diagnostic.jump({ float = true, count = -1 })
        end, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    -- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    -- for type, icon in pairs(signs) do
    --   local hl = "DiagnosticSign" .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    -- end

    local util = require("lspconfig.util")

    lspconfig["twiggy_language_server"].setup {
      capabilities = capabilities,
      cmd = { "twiggy-language-server", "--stdio" },
      filetypes = { "twig" },
      root_dir = util.root_pattern("composer.json"),

      settings = {
        twiggy = {
          framework = "symfony",
          phpExecutable = "/usr/bin/php",
          symfonyConsolePath = "bin/console",
          diagnostics = {
            twigCsFixer = true,
          },
        },
      },
    }


    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      languages = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
    })

    -- lspconfig["angularls"].setup({
    --   capabilities = capabilities,
    --   cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
    --   root_dir = require("lspconfig.util").root_pattern("angular.json"),
    -- })

    -- lspconfig["intelephense"].setup({
    --   filetypes = { "php", "blade", "twig" }
    -- })
    -- lspconfig["emmet_ls"].setup({
    --   filetypes = { "blade", "html", "css", "javascript", "typescript" }
    -- })
    lspconfig["basedpyright"].setup({
      capabilities = capabilities
    })
    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })
  end,
}
