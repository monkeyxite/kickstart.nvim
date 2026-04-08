-- Mail ftplugin: treesitter, snippets, highlighting
vim.treesitter.language.register('markdown', 'mail')
pcall(vim.treesitter.start, 0, 'markdown')

local ok, ls = pcall(require, 'luasnip')
if ok then ls.filetype_extend('mail', { 'markdown' }) end

local ns = vim.api.nvim_create_namespace('mail_headers')
local function highlight_headers()
  vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
  for i, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
    if line == '' then break end
    local colon = line:find(':')
    if colon then
      vim.api.nvim_buf_add_highlight(0, ns, '@keyword', i - 1, 0, colon)
      vim.api.nvim_buf_add_highlight(0, ns, '@string', i - 1, colon, -1)
    end
  end
end
highlight_headers()
vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, { buffer = 0, callback = highlight_headers })

vim.opt_local.spell = true
vim.opt_local.spelllang = 'en,sv'
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
