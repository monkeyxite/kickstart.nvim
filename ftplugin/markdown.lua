vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true

vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldmethod = 'expr'
vim.wo.foldlevel = 99
vim.wo.foldnestmax = 4
vim.wo.foldtext = ''
vim.wo.fillchars = 'fold: '
vim.opt_local.foldopen:append { 'jump', 'mark', 'search' }

vim.opt_local.spell = true
vim.opt_local.spelllang = 'en'
vim.opt_local.spellfile = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'

-- Fold with Enter
vim.keymap.set('n', '<CR>', function()
  if vim.fn.foldlevel('.') > 0 then
    vim.cmd 'normal! za'
  else
    vim.feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'n')
  end
end, { buffer = true, desc = 'Toggle fold / Enter' })

-- Jump between headings
vim.keymap.set('n', 'gj', function()
  vim.fn.search([[^##\+\s]], 'W')
  vim.cmd 'nohlsearch'
end, { buffer = true, desc = 'Next heading' })
vim.keymap.set('n', 'gk', function()
  vim.fn.search([[^##\+\s]], 'bW')
  vim.cmd 'nohlsearch'
end, { buffer = true, desc = 'Previous heading' })
