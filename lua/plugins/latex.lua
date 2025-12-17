return {
  "lervag/vimtex",
  lazy = false,
  config = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '-pdf',
        '-pdflatex=lualatex',
        '-interaction=nonstopmode',
        '-halt-on-error',
        '-synctex=1',
      },
    }
  end
}
