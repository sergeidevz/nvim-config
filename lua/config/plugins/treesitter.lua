local config = function () 
  local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "c_sharp" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
  end

return config