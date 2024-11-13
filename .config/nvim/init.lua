require("./lazy")
require("./lsp")

vim.opt.relativenumber = true
vim.cmd.colorscheme "catppuccin-mocha"
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
