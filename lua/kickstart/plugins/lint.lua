return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      -- markdown/quarto: panache handles formatting, obsidian-cli handles link validation
      -- markdown = { 'markdownlint-cli2' },
      -- quarto = { 'markdownlint-cli2' },
    }

    lint.linters['markdownlint-cli2'].args = { '--config', vim.fn.expand '$HOME/.markdownlint-cli2.yaml', '-' }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        if vim.bo.modifiable then
          lint.try_lint()
        end
      end,
    })
  end,
}
