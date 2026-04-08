local M = {}

function M.setup()
  local p = {
    bg = "#333333",
    bg_alt = "#3f3f3f",
    bg_highlight = "#f3f3f3",
    fg = "#ffffff",
    fg_muted = "#f3f3f3",
    accent = "#7aa2f7",
    green = "#01d309",
    yellow = "#faff00",
    red = "#e06c75",
    cyan = "#d7ba7d",
    magenta = "#d7ba7d",
    orange = "#d7ba7d",
    none = "NONE",
    white = "#ffffff"
  }

  local set = vim.api.nvim_set_hl
  local link = function(from, to)
    set(0, from, { link = to })
  end

  vim.o.background = "dark"
  vim.o.termguicolors = true

  set(0, "Normal", { fg = p.fg, bg = p.bg })
  set(0, "NormalNC", { fg = p.fg, bg = p.bg })
  set(0, "NormalFloat", { fg = p.fg, bg = p.bg_alt })
  set(0, "FloatBorder", { fg = p.bg_highlight, bg = p.bg_alt })
  set(0, "LineNr", { fg = p.fg_muted, bg = p.none })
  set(0, "CursorLineNr", { fg = p.accent, bg = p.none, bold = true })
  set(0, "CursorLine", { bg = p.bg_alt })
  set(0, "SignColumn", { fg = p.fg_muted, bg = p.bg })
  set(0, "WinSeparator", { fg = p.bg_highlight, bg = p.none })
  set(0, "VertSplit", { fg = p.bg_highlight, bg = p.none })
  set(0, "Pmenu", { fg = p.fg, bg = p.bg_alt })
  set(0, "PmenuSel", { fg = p.bg, bg = p.accent, bold = true })
  set(0, "Visual", { bg = p.bg_highlight })
  set(0, "Search", { fg = p.bg, bg = p.yellow })
  set(0, "IncSearch", { fg = p.bg, bg = p.orange, bold = true })
  set(0, "StatusLine", { fg = p.fg, bg = p.bg_alt })
  set(0, "StatusLineNC", { fg = p.fg_muted, bg = p.bg_alt })
  set(0, "ColorColumn", { bg = p.bg_alt })

  set(0, "Comment", { fg = p.green, italic = true })
  set(0, "Constant", { fg = p.white })
  set(0, "String", { fg = p.green })
  set(0, "Identifier", { fg = p.white })
  set(0, "Function", { fg = p.white })
  set(0, "Statement", { fg = p.magenta })
  set(0, "Keyword", { fg = p.yellow })
  set(0, "Type", { fg = p.white, bold = true })
  set(0, "PreProc", { fg = p.orange })
  set(0, "Special", { fg = p.yellow })
  set(0, "Title", { fg = p.accent, bold = true })
  set(0, "Todo", { fg = p.bg, bg = p.yellow, bold = true })

  set(0, "DiagnosticError", { fg = p.red })
  set(0, "DiagnosticWarn", { fg = p.yellow })
  set(0, "DiagnosticInfo", { fg = p.accent })
  set(0, "DiagnosticHint", { fg = p.cyan })

  set(0, "DiagnosticSignError", { fg = p.red, bg = p.none })
  set(0, "DiagnosticSignWarn", { fg = p.yellow, bg = p.none })
  set(0, "DiagnosticSignInfo", { fg = p.accent, bg = p.none })
  set(0, "DiagnosticSignHint", { fg = p.cyan, bg = p.none })

  set(0, "DiagnosticVirtualTextError", { fg = p.red, bg = p.none })
  set(0, "DiagnosticVirtualTextWarn", { fg = p.yellow, bg = p.none })
  set(0, "DiagnosticVirtualTextInfo", { fg = p.accent, bg = p.none })
  set(0, "DiagnosticVirtualTextHint", { fg = p.cyan, bg = p.none })

  set(0, "DiagnosticUnderlineError", { undercurl = true, sp = p.red })
  set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = p.yellow })
  set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = p.accent })
  set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = p.cyan })

  link("@comment", "Comment")
  link("@string", "String")
  link("@function", "Function")
  link("@variable", "Function")
  link("@keyword", "Keyword")
  link("@type", "Type")
end

return M
