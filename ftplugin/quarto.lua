vim.g.slime_cell_delimiter = '```'

vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true

vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldmethod = 'expr'
vim.wo.foldlevel = 99
vim.wo.foldnestmax = 4
vim.wo.foldtext = ''
vim.wo.fillchars = 'fold: '

vim.opt_local.spell = true
vim.opt_local.spelllang = 'en,sv'
