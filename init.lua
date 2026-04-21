-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true
vim.opt.autochdir = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true
vim.o.swapfile = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- For bufferline
vim.opt.termguicolors = true

-- For Avante: views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- nvim-tree https://github.com/nvim-tree/nvim-tree.lua?tab=readme-ov-file
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', '<cmd>Trouble diagnostics toggle<CR>', { desc = '[Q]uickfix diagnostics' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--bufferline
vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', { noremap = true, desc = '[P]ick' })
vim.keymap.set('n', '<leader>bj', ':BufferLineCycleNext<CR>', { noremap = true, desc = '[J] Next' })
vim.keymap.set('n', '<leader>bk', ':BufferLineCyclePrev<CR>', { noremap = true, desc = '[K] Previous' })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, desc = '[D]elete' })
vim.keymap.set('n', '<leader>bcp', ':BufferLinePickClose<CR>', { noremap = true, desc = '[C]lose [P]ick' })
vim.keymap.set('n', '<leader>bco', ':BufferLineCloseOthers<CR>', { noremap = true, desc = '[C]lose [O]thers' })

--dashboard
vim.keymap.set('n', '<leader>;', ':lua MiniStarter.open()<CR>', { noremap = true, desc = '[;] Dashboard' })

--code
vim.keymap.set('n', '<leader>cz', ':lua Snacks.zen()<CR>', { noremap = true, desc = '[Z]en mode' })
vim.keymap.set('n', '<leader>cv', function()
  local cfg = vim.diagnostic.config()
  if cfg.virtual_text then
    vim.diagnostic.config { virtual_text = false }
    vim.notify 'Virtual text OFF'
  else
    vim.diagnostic.config { virtual_text = { source = true, spacing = 2 } }
    vim.notify 'Virtual text ON'
  end
end, { desc = '[V]irtual text toggle' })

--file tree toggle
vim.keymap.set('n', '<leader>e', ':lua MiniFiles.open()<CR>', { noremap = true, desc = '[E]xplorer' })

-- quarto quick add
vim.keymap.set({ 'n', 'i' }, '<M-i>', '<esc>o```{python}<cr>```<esc>O', { desc = '[i]nsert python code chunk' })
-- IPython Term
vim.keymap.set({ 'n' }, '<leader>ci', ':split term://ipython<cr>', { desc = '[i]Python terminal' })
-- Quarto/Markdown preview
vim.keymap.set('n', '<leader>np', ':QuartoPreview<CR>', { desc = '[P]review Quarto' })
vim.keymap.set('n', '<leader>nr', ':QuartoRender<CR>', { desc = '[R]ender Quarto' })
vim.keymap.set('n', '<leader>nm', ':MarkdownPreview<CR>', { desc = '[M]arkdown preview' })
-- Obsidian
vim.keymap.set('n', '<leader>nb', ':Obsidian backlinks<CR>', { desc = '[B]acklinks' })
vim.keymap.set('n', '<leader>nl', ':Obsidian link<CR>', { desc = '[L]ink selection' })
vim.keymap.set('n', '<leader>nL', ':Obsidian links<CR>', { desc = '[L]inks (current note)' })
vim.keymap.set('n', '<leader>nf', ':Obsidian follow_link<CR>', { desc = '[F]ollow link' })
vim.keymap.set('n', '<leader>nn', ':Obsidian new<CR>', { desc = '[N]ew note' })
vim.keymap.set('n', '<leader>ns', ':Obsidian search<CR>', { desc = '[S]earch vault' })
vim.keymap.set('n', '<leader>no', ':Obsidian quick_switch<CR>', { desc = '[O]pen quickswitch' })
vim.keymap.set('n', '<leader>ni', ':Obsidian paste_img<CR>', { desc = '[I]mage paste' })
vim.keymap.set('n', '<leader>nw', ':Obsidian workspace<CR>', { desc = '[W]orkspace' })
vim.keymap.set('n', '<leader>nt', ':Obsidian toggle_checkbox<CR>', { desc = '[T]oggle checkbox' })
vim.keymap.set('n', '<leader>nc', ':Obsidian toc<CR>', { desc = 'Table of [C]ontents' })


vim.keymap.set('n', '<leader>nd', ':Obsidian today<CR>', { desc = '[D]aily note' })
vim.keymap.set('n', '<leader>ny', ':Obsidian yesterday<CR>', { desc = '[Y]esterday note' })

-- AI
vim.keymap.set({ 'n', 'v' }, '<leader>ac', ':CodeCompanionChat Toggle<cr>', { desc = '[C]hat toggle' })
vim.keymap.set({ 'n', 'v' }, '<leader>aa', ':CodeCompanionActions<cr>', { desc = '[A]ctions' })
vim.keymap.set({ 'v' }, '<leader>av', ':CodeCompanionChat Add<cr>', { desc = 'Add [V]isual' })
vim.keymap.set('n', '<leader>aq', ':lua _kiro_toggle()<CR>', { desc = 'Kiro [Q]' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
--clean linenum
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'remove linenum in Term',
  group = vim.api.nvim_create_augroup('kickstart-termopen', { clear = true }),
  callback = function()
    vim.wo.number = false
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  {
    'NMAC427/guess-indent.nvim',
    opts = {
      -- markdown/quarto rely on ftplugin definitions
      filetype_exclude = { 'markdown', 'quarto' },
    },
  },

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --

  -- Alternatively, use `config = function() ... end` for full control over the configuration.
  -- If you prefer to call `setup` explicitly, use:
  --    {
  --        'lewis6991/gitsigns.nvim',
  --        config = function()
  --            require('gitsigns').setup({
  --                -- Your gitsigns configuration here
  --            })
  --        end,
  --    }
  --
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`.
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>a', group = 'AI', icon = { icon = '󰧑', color = 'cyan' } },
        { '<leader>b', group = 'Buffer', icon = { icon = '󰓩', color = 'blue' }, mode = { 'n', 'x' } },
        { '<leader>c', group = 'Code', icon = { icon = '󰅪', color = 'orange' }, mode = { 'n', 'x' } },
        { '<leader>d', group = 'Document', icon = { icon = '󰈬', color = 'yellow' } },
        { '<leader>e', icon = { icon = '󰙅', color = 'green' } },
        { '<leader>f', icon = { icon = '󰉼', color = 'blue' } },
        { '<leader>g', group = 'Git', icon = { icon = '󰊢', color = 'red' } },
        { '<leader>h', group = 'Hunk', icon = { icon = '󰊢', color = 'red' }, mode = { 'n', 'v' } },
        { '<leader>n', group = 'Notes/MD', icon = { icon = '󰎞', color = 'cyan' } },
        { '<leader>q', icon = { icon = '󰒡', color = 'yellow' } },
        { '<leader>r', group = 'Rename', icon = { icon = '󰏪', color = 'purple' } },
        { '<leader>s', group = 'Search', icon = { icon = '󰍉', color = 'green' } },
        { '<leader>;', icon = { icon = '󰍜', color = 'purple' } },
        { '<leader>/', icon = { icon = '󰈞', color = 'blue' } },
        { '<leader><leader>', icon = { icon = '󱦞', color = 'azure' } },
        { '<leader>o', group = 'Mini Sessi[o]n', icon = { icon = '󰆔', color = 'green' } },
        { '<leader>y', group = '[Y]ank Path', icon = { icon = '󰆏', color = 'orange' } },
        { '<localleader>h', group = 'MD [H]eader', icon = { icon = '󰉫', color = 'blue' } },
        { '<localleader>i', group = 'Py [i]Python', icon = { icon = '󰌠', color = 'yellow' } },
        { '<localleader>t', group = 'MD [T]able', icon = { icon = '󰓫', color = 'orange' } },
        { '<localleader>m', group = 'Neo[M]utt', icon = { icon = '󰇮', color = 'cyan' } },
      },
    },
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          projects = {
            prompt_prefix = '󱎸  ',
            layout_strategy = 'horizontal',
            layout_config = {
              anchor = 'N',
              height = 0.25,
              width = 0.6,
              prompt_position = 'bottom',
            },
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      -- pcall(require('telescope').load_extension, 'projects')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[G]rep' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[B]uffers' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[D]iagnostics' })
      vim.keymap.set('n', '<leader>sp', builtin.resume, { desc = '[P]revious (resume)' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Recent [.]' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          -- NOTE: gra and <leader>ca mapped globally below LspAttach to avoid per-client override

          -- Find references for the word under your cursor.
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>ch', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, 'Inlay [H]ints toggle')
          end
        end,
      })

      -- Code action via actions-preview (better UI with diff preview)
      vim.keymap.set({ 'n', 'x' }, 'gra', function() require('actions-preview').code_actions() end, { desc = 'Code Action' })
      vim.keymap.set({ 'n', 'x' }, '<leader>ca', function() require('actions-preview').code_actions() end, { desc = 'Code Action' })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = true },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = true,
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Grammar/spelling handled by harper_ls (no custom handlers needed)

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'workspace',
              },
            },
          },
          capabilities = {
            workspace = { didChangeWatchedFiles = { dynamicRegistration = false } },
          },
        },
        ruff = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        -- ts_ls = {},
        --

        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
        harper_ls = {
          filetypes = { 'markdown', 'quarto', 'mail', 'text', 'tex', 'latex' },
          settings = {
            ['harper-ls'] = {
              markdown = {
                IgnoreLinkTitle = true,
              },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      --
      -- `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      --
      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
        'ruff', -- Python linter + formatter
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true, yaml = true, markdown = true, quarto = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'ruff_organize_imports', 'ruff_format' },
        markdown = { 'injected', 'markdownlint-cli2' },
        quarto = { 'injected', 'markdownlint-cli2' },
        mail = { 'injected' },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { , "prettier", stop_after_first = true },
      },
      opts = {
        formatters = {
          ['markdownlint-cli2'] = {
            args = { '--config', vim.fn.expand '$HOME/.markdownlint-cli2.yaml', '--fix', '$FILENAME' },
          },
          injected = {
            options = {
              ignore_errors = false,
              lang_to_ext = {
                markdown = 'md',
                python = 'py',
                r = 'r',
                rust = 'rs',
                lua = 'lua',
              },
            },
          },
        },
      },
    },
  },

  { -- Autocompletion
    'saghen/blink.cmp',
    enabled = true,
    dev = false,
    build = 'cargo build --release',
    lazy = false,
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
          require('luasnip.loaders.from_vscode').lazy_load { paths = { vim.fn.stdpath 'config' .. '/snips' } }
          require('luasnip').filetype_extend('quarto', { 'markdown' })
        end,
      },
      { 'moyiz/blink-emoji.nvim' },
      { 'Kaiser-Yang/blink-cmp-git' },
      {
        'saghen/blink.compat',
        dev = false,
        opts = { impersonate_nvim_cmp = true, enable_events = true, debug = true },
      },
      {
        'jmbuhr/cmp-pandoc-references',
        dev = false,
        ft = { 'quarto', 'markdown', 'rmarkdown' },
      },
      { 'kdheepak/cmp-latex-symbols' },
      { 'erooke/blink-cmp-latex' },
      'ribru17/blink-cmp-spell',
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        opts = {},
      },
      'jmbuhr/otter.nvim',
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'enter',
        ['<c-y>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<c-d>'] = { 'scroll_documentation_down', 'fallback' },
        ['<c-u>'] = { 'scroll_documentation_up', 'fallback' },
        ['<c-k>'] = {},
      },
      cmdline = {
        enabled = false,
      },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'references', 'git', 'snippets', 'buffer', 'emoji', 'latex', 'spell' },
        per_filetype = {
          codecompanion = { 'codecompanion', 'path' },
        },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          git = {
            module = 'blink-cmp-git',
            name = 'Git',
            opts = {},
            enabled = function()
              return vim.tbl_contains({ 'octo', 'gitcommit', 'git' }, vim.bo.filetype)
            end,
          },
          spell = {
            name = 'Spell',
            module = 'blink-cmp-spell',
            enabled = function()
              return vim.tbl_contains({ 'markdown', 'quarto', 'tex', 'mail' }, vim.bo.filetype)
            end,
            opts = {
              enable_in_context = function()
                local curpos = vim.api.nvim_win_get_cursor(0)
                local captures = vim.treesitter.get_captures_at_pos(0, curpos[1] - 1, curpos[2] - 1)
                local in_spell_capture = false
                for _, cap in ipairs(captures) do
                  if cap.capture == 'spell' then
                    in_spell_capture = true
                  elseif cap.capture == 'nospell' then
                    return false
                  end
                end
                return in_spell_capture
              end,
            },
          },
          emoji = {
            module = 'blink-emoji',
            name = 'Emoji',
            score_offset = -1,
            enabled = function()
              return vim.tbl_contains({ 'markdown', 'quarto' }, vim.bo.filetype)
            end,
          },
          references = {
            name = 'pandoc_references',
            module = 'cmp-pandoc-references.blink',
            score_offset = 2,
          },
          symbols = { name = 'symbols', module = 'blink.compat.source' },
          latex = {
            name = 'Latex',
            module = 'blink-cmp-latex',
            opts = {
              insert_command = function(ctx)
                local ft = vim.api.nvim_get_option_value('filetype', {
                  scope = 'local',
                  buf = ctx.bufnr,
                })
                if ft == 'tex' or ft == 'quarto' or ft == 'latex' then
                  return true
                end
                return false
              end,
            },
          },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          treesitter_highlighting = true,
          window = {
            min_width = 10,
            max_width = 60,
            max_height = 20,
            border = 'rounded',
          },
        },
        menu = {
          auto_show = true,
          draw = {
            columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'source_icon' } },
            components = {
              source_icon = {
                ellipsis = false,
                text = function(ctx)
                  local icons = {
                    lsp = '󰞵',
                    path = '󰉋',
                    buffer = '󰈙',
                    snippets = '󰩫',
                    lazydev = '󰢱',
                    codecompanion = '󱜸',
                    pandoc_references = '󰈔',
                    Git = '󰊢',
                    Spell = '󰓆',
                    Emoji = '󰞅',
                    Latex = '󰿈',
                  }
                  return icons[ctx.source_name] or ctx.source_name
                end,
              },
            },
          },
        },
        ghost_text = {
          enabled = false,
        },
      },
      snippets = { preset = 'luasnip' },
      signature = { enabled = true },
    },
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-moon'
    end,
  },

  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   config = function()
  --     require('catppuccin').setup {
  --       flavour = 'mocha', -- latte, frappe, macchiato, mocha
  --       background = { -- :h background
  --         light = 'latte',
  --         dark = 'macchiato',
  --       },
  --       transparent_background = false, -- disables setting the background color.
  --       show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  --       term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  --       dim_inactive = {
  --         enabled = false, -- dims the background color of inactive window
  --         shade = 'dark',
  --         percentage = 0.15, -- percentage of the shade to apply to the inactive window
  --       },
  --       no_italic = false, -- Force no italic
  --       no_bold = false, -- Force no bold
  --       no_underline = false, -- Force no underline
  --       styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
  --         comments = { 'italic' }, -- Change the style of comments
  --         conditionals = { 'italic' },
  --         loops = {},
  --         functions = {},
  --         keywords = {},
  --         strings = {},
  --         variables = {},
  --         numbers = {},
  --         booleans = {},
  --         properties = {},
  --         types = {},
  --         operators = {},
  --       },
  --       color_overrides = {},
  --       custom_highlights = {},
  --       integrations = {
  --         cmp = true,
  --         gitsigns = true,
  --         nvimtree = true,
  --         treesitter = true,
  --         notify = true,
  --         which_key = true,
  --         neogit = true,
  --         alpha = true,
  --         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  --         render_markdown = true,
  --       },
  --     }
  --   end,
  --   init = function()
  --     vim.cmd.colorscheme 'catppuccin'
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
      { '<leader>qd', '<cmd>Trouble diagnostics toggle<CR>', desc = '[D]iagnostics' },
      { '<leader>qb', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = '[B]uffer diagnostics' },
      { '<leader>qs', '<cmd>Trouble symbols toggle<CR>', desc = '[S]ymbols' },
      { '<leader>ql', '<cmd>Trouble loclist toggle<CR>', desc = '[L]oclist' },
      { '<leader>qf', '<cmd>Trouble qflist toggle<CR>', desc = 'Quick[F]ix' },
    },
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- files
      require('mini.files').setup()
      -- diff
      require('mini.diff').setup()
      -- autopairs
      require('mini.pairs').setup()
      --startify
      local stats = require('lazy').stats()
      local starter = require 'mini.starter'
      starter.setup {
        items = {
          starter.sections.sessions(10, true),
          starter.sections.recent_files(10, false, true),
          {
            { name = 'Lazy', action = 'Lazy', section = '󰏗 Updaters' },
            { name = 'Mason', action = 'Mason', section = '󰏗 Updaters' },
          },
          {
            { name = 'Edit new', action = 'enew', section = '󰌧 Actions' },
            { name = 'Find file', action = 'Telescope find_files', section = '󰌧 Actions' },
            { name = 'Quit', action = 'qall', section = '󰌧 Actions' },
          },
        },
        content_hooks = {
          starter.gen_hook.adding_bullet '  ',
          starter.gen_hook.aligning('center', 'center'),
        },
        header = function()
          local banner = [[
       .-"-.            .-"-.            .-"-.           .-"-.
     _/_-.-_\_        _/.-.-.\_        _/.-.-.\_       _/.-.-.\_
    / __} {__ \      /|( o o )|\      ( ( o o ) )     ( ( o o ) )
   / //  "  \\ \    | //  "  \\ |      |/  "  \|       |/  "  \|
  / / \'---'/ \ \  / / \'---'/ \ \      \'/^\'/         \ '~' /
  \ \_/`"""`\_/ /  \ \_/`"""`\_/ /      /`\ /`\         /`"""`\
   \           /    \           /      /  /|\  \       /       \

-={ see no evil }={ hear no evil }={ speak no evil }={ have more fun }=-
           ]]
          --           local banner = [[
          -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣴⣶⣶⣶⣶⣶⣶⣶⣶⣶⣦⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣮⣉⠙⠳⢶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠉⠻⢶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠈⠛⢷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠙⠻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠈⠻⣦⣀⠀⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣆⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣧⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⠀⠀⠀⠀
          -- ⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣷⡀⠀⠀
          -- ⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣤⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣧⠀⠀
          -- ⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠀
          -- ⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⠀
          -- ⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆
          -- ⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇
          -- ⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇
          -- ⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠟⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇
          -- ⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇
          -- ⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇
          -- ⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇
          -- ⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀
          -- ⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡇⠀
          -- ⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀
          -- ⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠁⠀⠀
          -- ⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠁⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠟⠁⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⠿⠿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣶⠏⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡶⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡶⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠿⣿⣿⣷⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⠴⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⡉⣛⡛⠻⠶⠦⠤⠤⠤⠤⠤⠤⠤⠤⠶⠖⠛⠛⠋⣁⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          --           ]]
          return banner
        end,
        footer = 'loaded ' .. stats.count .. ' plugins ',
      }
      ---------------------------------------------------------------------
      -- mini.sessions ----------------------------------------------------
      -- TODO fix keymapping
      ---------------------------------------------------------------------
      require('mini.sessions').setup()
      vim.keymap.set('n', '<leader>oo', "<cmd>lua MiniSessions.select('read')<CR>", { desc = '[O]pen' })
      vim.keymap.set('n', '<leader>od', "<cmd>lua MiniSessions.select('delete')<CR>", { desc = '[D]elete' })
      vim.keymap.set('n', '<leader>os', function()
        local ok, res = pcall(vim.fn.input, {
          prompt = 'Save session as: ',
          cancelreturn = false,
        })
        if not ok or res == false then
          return nil
        end
        MiniSessions.write(res)
      end, { desc = 'Save Session' })
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    pin = true, -- pinned: local nvim 0.12 compat fix, unpin after upstream merges it
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'yaml' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  -- Grammar/spelling: harper_ls (no plugins needed, standard LSP code actions)
  {
    'aznhe21/actions-preview.nvim',
    event = 'LspAttach',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('actions-preview').setup {
        diff = { algorithm = 'patience' },
        backend = { 'telescope' },
        telescope = {
          sorting_strategy = 'ascending',
          layout_strategy = 'vertical',
          layout_config = {
            width = 0.6,
            height = 0.5,
          },
        },
        highlight_command = { require('actions-preview.highlight').delta 'delta --side-by-side' },
      }
    end,
  },
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  -- jupytext: open ipynb as quarto
  {
    'GCBallesteros/jupytext.nvim',
    opts = {
      style = 'quarto',
      force_ft = 'quarto',
    },
  },
  -- quarto
  {
    'quarto-dev/quarto-nvim',
    ft = { 'quarto' },
    dev = false,
    opts = {},
    dependencies = {
      -- for language features in code cells
      -- configured in lua/plugins/lsp.lua and
      -- added as a nvim-cmp source in lua/plugins/completion.lua
      'jmbuhr/otter.nvim',
    },
    config = function()
      require('quarto').setup {
        lspFeatures = {
          enabled = true,
          languages = { 'r', 'python', 'rust' },
          chunks = 'curly',
          diagnostics = {
            enabled = true,
            triggers = { 'BufWritePost' },
          },
          completion = {
            enabled = true,
          },
        },
        keymap = {
          hover = 'H',
          definition = 'gd',
          rename = '<leader>rn',
          references = 'gr',
          format = '<leader>gf',
        },
        codeRunner = {
          enabled = true,
          default_method = 'slime',
        },
      }
    end,
  },
  {
    'jpalardy/vim-slime',
    dev = false,
    init = function()
      vim.b['quarto_is_python_chunk'] = false
      Quarto_is_in_python_chunk = function()
        require('otter.tools.functions').is_otter_language_context 'python'
      end

      vim.cmd [[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      if exists('b:quarto_is_r_mode') && b:quarto_is_r_mode && b:quarto_is_python_chunk
      return [a:text, "\n"]
      else
      return [a:text]
      end
      end
      endfunction
      ]]

      vim.g.slime_target = 'neovim'
      vim.g.slime_no_mappings = true
      vim.g.slime_python_ipython = 1
    end,
    config = function()
      vim.g.slime_input_pid = false
      vim.g.slime_suggest_default = true
      vim.g.slime_menu_config = false
      vim.g.slime_neovim_ignore_unlisted = true

      local function mark_terminal()
        local job_id = vim.b.terminal_job_id
        vim.print('job_id: ' .. job_id)
      end

      local function set_terminal()
        vim.fn.call('slime#config', {})
      end
      vim.keymap.set('n', '<leader>ct', mark_terminal, { desc = 'Mark [T]erminal' })
      vim.keymap.set('n', '<leader>cs', set_terminal, { desc = '[S]et terminal' })
      vim.keymap.set({ 'n', 'i' }, '<M-cr>', function()
        vim.cmd [[call slime#send_cell()]]
      end, { desc = 'send code cell to term' })
    end,
  },
  --mail
  -- TODO to fix ft for mail to enable keymapping of spelling/mail
  {
    'dbeniamine/vim-mail',
    ft = 'mail',
    init = function()
      vim.cmd 'let g:VimMailDoNotMap=1'
      vim.cmd "let g:VimMailContactsProvider=['khard']"
      vim.cmd "let g:VimMailClient='neomutt'"
      vim.cmd "let g:VimMailSpellLangs=['en', 'se']"
      vim.cmd "let g:VimMailFromList = [ 'Jonny Hou <jonny.hou@ericsson.com>', 'Jonny Hou <jonny.hou@gmail.com>', 'Jonny Hou <monkeyxite@gmail.com>' ]"
      vim.cmd 'let g:VimMailDoNotMap_m = 1'
      vim.cmd 'let g:VimMailDoNotMap_m = 1'
      vim.filetype.add {
        extension = { eml = 'mail' },
        pattern = {
          ['/tmp/neomutt%-.*'] = 'mail',
          ['/tmp/mutt%-.*'] = 'mail',
        },
      }
    end,
    config = function()
      -- Markdown treesitter for mail body
      vim.treesitter.language.register('markdown', 'mail')

      -- Markdown snippets in mail
      local ok_ls, ls = pcall(require, 'luasnip')
      if ok_ls then
        ls.filetype_extend('mail', { 'markdown' })
      end

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'mail',
        callback = function()
          -- Start markdown treesitter
          pcall(vim.treesitter.start, 0, 'markdown')

          -- Send mail keybinding
          vim.keymap.set('n', '<localleader>mm', function()
            local lines = vim.api.nvim_buf_get_lines(0, 0, 20, false)
            local acct = ''
            local has_markdown = false
            for _, line in ipairs(lines) do
              if line:match '^From:.*ericsson' then
                acct = '-e "source ~/.config/mutt/accounts/2-work.muttrc"'
              elseif line:match '^From:.*monkeyxite' or line:match '^From:.*gmail' then
                acct = '-e "source ~/.config/mutt/accounts/1-monkeyxite@gmail.com.muttrc"'
              end
              if line:match '^#' then
                has_markdown = true
              end
            end
            vim.cmd 'write'
            if has_markdown then
              vim.cmd 'write'
              vim.fn.system('cat ' .. vim.fn.expand '%' .. ' | muttlook --action draft')
              vim.cmd('terminal neomutt ' .. acct .. ' -H ' .. vim.fn.expand '%')
            else
              vim.cmd('terminal neomutt ' .. acct .. ' -H ' .. vim.fn.expand '%')
            end
          end, { buffer = true, desc = ' Send mail' })

          -- Highlight mail headers
          local ns = vim.api.nvim_create_namespace 'mail_headers'
          local function highlight_headers()
            vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
            for i, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
              if line == '' then
                break
              end
              local colon = line:find ':'
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

          -- Unmap vim-mail's ,m (replaced by ,S)
          vim.defer_fn(function()
            -- Clean any stray root-level mail mappings
            for _, k in ipairs { ',q', ',m' } do
              pcall(vim.keymap.del, 'n', k, { buffer = 0 })
              pcall(vim.keymap.del, 'v', k, { buffer = 0 })
              pcall(vim.keymap.del, '', k, { buffer = 0 })
            end
            -- All vim-mail keys under ,m prefix with mail icon
            local mail_keys = {
              { ',mq', '<Plug>MailQuote', ' Quote' },
              { ',mm', 'send', ' Send mail' }, -- placeholder, actual func is above
              { ',mt', ':call VimMailGoto("/^To","A") <CR>', ' To:' },
              { ',mc', ':call VimMailGoto("/^Cc","A") <CR>', ' Cc:' },
              { ',mb', ':call VimMailGoto("/^Bcc","A") <CR>', ' Bcc:' },
              { ',ms', ':call VimMailGoto("/^Subject","A") <CR>', ' Subject:' },
              { ',mf', ':call VimMailGoto("/^From","A") <CR>', ' From:' },
              { ',mF', ':call vimmail#switchFrom() <CR>', ' Switch From' },
              { ',mr', ':call VimMailGoto("/^>","I") <CR>', ' Jump to reply' },
              { ',mR', ':call VimMailGoto("/^Reply-To","A") <CR>', ' Reply-To:' },
              { ',mM', ':call VimMailStartClientRO() <CR>', ' Open neomutt' },
              { ',mS', ':call VimMailGoto("/^-- ","j") <CR>', ' Jump to signature' },
              { ',mB', ':call VimMailGoto("/^$","I") <CR>', ' Jump to body' },
              { ',mE', ':call VimMailGoto("/^>","Nj") <CR>', ' End of reply' },
              { ',ml', ':call vimmail#spelllang#SwitchSpellLangs()<CR>', ' Switch spell lang' },
              { ',ma', ':call vimmail#contacts#sync()<CR>', ' Sync contacts' },
              { ',mk', ':call VimMailKillQuotedSig() <CR>', ' Kill quoted sig' },
            }
            for _, k in ipairs(mail_keys) do
              if k[1] ~= ',mm' then -- skip send placeholder
                pcall(vim.keymap.set, 'n', k[1], k[2], { buffer = true, desc = k[3] })
              end
            end
          end, 50)
        end,
      })
    end,
  },
  {
    'liuchengxu/graphviz.vim',
    ft = { 'dot', 'gv' },
  },
  {
    'weirongxu/plantuml-previewer.vim',
    ft = { 'plantuml' },
    dependencies = { 'aklt/plantuml-syntax', 'tyru/open-browser.vim' },
  },
  {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
    keys = {
      { '<leader>gg', '<cmd>Neogit<CR>', desc = 'Neo[G]it' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'sindrets/diffview.nvim', cmd = { 'DiffviewOpen', 'DiffviewFileHistory' } },
    },
    config = true,
  },
  --markdown preview
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown', 'quarto' },
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      vim.g.mkdp_auto_start = 1
      vim.g.mkdp_filetypes = { 'markdown', 'quarto' }
    end,
  },
  -- markdown editing helper
  {
    'yousefhadder/markdown-plus.nvim',
    ft = 'markdown',
    config = function()
      require('markdown-plus').setup {
        -- Configuration options (all optional)
        enabled = true,
        features = {
          list_management = true, -- Enable list management features
          text_formatting = true, -- Enable text formatting features
          headers_toc = true, -- Enable headers and TOC features
          links = true, -- Enable link management features
        },
        keymaps = {
          enabled = true, -- Enable default keymaps
        },
      }
    end,
  },
  --toggle term
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float',
      open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
    },
  },
  {
    url = 'https://git.sr.ht/~havi/telescope-toggleterm.nvim',
    event = 'TermOpen',
    dependencies = {
      'akinsho/toggleterm.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension 'toggleterm'
      require('telescope-toggleterm').setup {
        telescope_mappings = {
          -- <ctrl-c> : kill the terminal buffer (default) .
          ['<C-c>'] = require('telescope-toggleterm').actions.exit_terminal,
        },
      }
    end,
  },
  --markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'quarto', 'codecompanion' },
    opts = {
      file_types = { 'markdown', 'quarto', 'codecompanion' },
      heading = {
        sign = false,
        icons = { '▌ ', '▌▌ ', '▌▌▌ ', '▌▌▌▌ ', '▌▌▌▌▌ ', '▌▌▌▌▌▌ ' },
        width = 'full',
      },
      checkbox = {
        unchecked = { icon = '󰄱 ', highlight = 'RenderMarkdownUnchecked' },
        checked = { icon = '󰱒 ', highlight = 'RenderMarkdownChecked', scope_highlight = 'RenderMarkdownChecked' },
        custom = {
          progress = { raw = '[/]', rendered = '󰦖 ', highlight = 'RenderMarkdownTodo' },
          important = { raw = '[!]', rendered = '󰀦 ', highlight = 'RenderMarkdownError' },
          question = { raw = '[?]', rendered = '󰘥 ', highlight = 'RenderMarkdownWarn' },
        },
      },
      code = {
        language_name = true,
        language_icon = true,
        language_map = {
          dataviewjs = 'javascript',
          dataview = 'sql',
        },
      },
      latex = {
        enabled = false,
      },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
  {
    'folke/snacks.nvim',
    opts = {
      notifier = {
        enabled = true,
        style = 'compact',
        timeout = 2500,
      },
      image = {
        enabled = true,
        -- your image configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        doc = {
          inline = false,
          float = true,
          max_width = 100,
          max_height = 50,
          conceal = function(lang, type)
            -- only conceal math expressions
            return type == 'math'
          end,
        },
        math = {
          enabled = true, -- disable math expression rendering, relying on render-markdown
        },
        resolve = function(path, src)
          if require('obsidian.api').path_is_note(path) then
            -- for setting both image review & paste if needed
            return require('obsidian.api').resolve_image_path(src):gsub('3_Resource/assets/3_Resource/assets', '3_Resource/assets')
          end
        end,
      },
      zen = {},
      bigfile = {},
    },
  },
  {
    'lervag/vimtex',
    ft = { 'tex', 'latex' },
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_zathura_use_synctex = 0
      -- vim.g.vimtex_view_method = 'zathura_simple'
      vim.g.vimtex_view_method = 'zathura'
    end,
  },
  {
    'obsidian-nvim/obsidian.nvim',
    -- version = '3.15.3',
    lazy = true,
    ft = { 'markdown', 'qmd', 'quarto' },
    -- enabled = true,
    -- event = { 'BufReadPre  ' .. vim.fn.expand '~' .. 'knowledgebase/**.md' },
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
    -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '/Users/ehoujin/knowledgebase',
        },
        {
          name = 'work',
          path = '/Users/ehoujin/OneDrive - Ericsson/Documents/Radio_KB',
        },
        {
          name = 'asgard',
          path = '/Users/ehoujin/Ericsson - Remote Radio Global Solution Team - VIPP - VIPP/Anatomy',
        },
      },
      picker = { name = 'telescope.nvim' },
      legacy_commands = false,
      frontmatter = { enabled = false },
      statusline = { enabled = false }, -- Disable statusline to prevent it hammering ripgrep every second
      footer = {
        enabled = false, -- Disabling this fixed the lag and error
      },
      ui = {
        enable = false, -- set to false to disable all additional syntax features
      },
      checkbox = {
        enabled = true,
        create_new = false,
        order = { ' ', '/', 'x', '!', '?' },
      },
      -- Specify how to handle attachments.
      attachments = {
        -- The default folder to place images in via `:ObsidianPasteImg`.
        -- If this is a relative path it will be interpreted as relative to the vault root.
        -- You can always override this per image by passing a full path to the command instead of just a filename.
        -- not need with snacks.image
        folder = '3_Resource/assets', -- This is the default
        -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
        ---@return string
        img_name_func = function()
          -- Match Obsidian naming: NoteName_YYYYMMDD
          local note = vim.fn.expand '%:t:r'
          return note .. '_' .. os.date '%Y%m%d'
        end,

        -- A function that determines the text to insert in the note when pasting an image.
        -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
        -- This is the default implementation.
        ---@param client obsidian.Client
        ---@param path obsidian.Path the absolute path to the image file
        ---@return string
        img_text_func = function(client, path)
          path = client:vault_relative_path(path) or path
          return string.format('![%s](%s)', path.name, path)
        end,
      },
    },
    config = function(_, opts)
      require('obsidian').setup(opts)
      -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
      -- see also: 'follow_url_func' config option below.
    end,
  },
  -- {
  --   'k-lar/dynomark.nvim',
  --   dependencies = 'nvim-treesitter/nvim-treesitter',
  --   opts = {},
  -- },
  {
    'josephburgess/nvumi',
    cmd = 'Nvumi',
    dependencies = { 'folke/snacks.nvim' },
    opts = {
      virtual_text = 'inline', -- or "newline"
      prefix = ' 🚀 ', -- prefix shown before the output
      date_format = 'iso', -- or: "uk", "us", "long"
      keys = {
        run = '<CR>', -- run/refresh calculations
        reset = 'R', -- reset buffer
        yank = '<leader>y', -- yank output of current line
        yank_all = '<leader>Y', -- yank all outputs
      },
      -- see below for more on custom conversions/functions
      custom_conversions = {},
      custom_functions = {},
    },
  },
  -- {
  --   '3rd/diagram.nvim',
  --   dependencies = {
  --     { '3rd/image.nvim', opts = {} }, -- you'd probably want to configure image.nvim manually instead of doing this
  --   },
  --   opts = { -- you can just pass {}, defaults below
  --     events = {
  --       render_buffer = { 'InsertLeave', 'BufWinEnter', 'TextChanged' },
  --       clear_buffer = { 'BufLeave' },
  --     },
  --     renderer_options = {
  --       mermaid = {
  --         background = nil, -- nil | "transparent" | "white" | "#hex"
  --         theme = nil, -- nil | "default" | "dark" | "forest" | "neutral"
  --         scale = 1, -- nil | 1 (default) | 2  | 3 | ...
  --         width = nil, -- nil | 800 | 400 | ...
  --         height = nil, -- nil | 600 | 300 | ...
  --         cli_args = nil, -- nil | { "--no-sandbox" } | { "-p", "/path/to/puppeteer" } | ...
  --       },
  --       plantuml = {
  --         charset = nil,
  --         cli_args = nil, -- nil | { "-Djava.awt.headless=true" } | ...
  --       },
  --       d2 = {
  --         theme_id = nil,
  --         dark_theme_id = nil,
  --         scale = nil,
  --         layout = nil,
  --         sketch = nil,
  --         cli_args = nil, -- nil | { "--pad", "0" } | ...
  --       },
  --       gnuplot = {
  --         size = nil, -- nil | "800,600" | ...
  --         font = nil, -- nil | "Arial,12" | ...
  --         theme = nil, -- nil | "light" | "dark" | custom theme string
  --         cli_args = nil, -- nil | { "-p" } | { "-c", "config.plt" } | ...
  --       },
  --     },
  --   },
  -- },
  {
    'vhyrro/luarocks.nvim',
    lazy = true,
    priority = 1001,
    opts = {
      rocks = { 'magick' },
    },
  },
  {
    '3rd/image.nvim',
    ft = { 'markdown', 'quarto', 'norg' },
    build = false,
    -- dependencies = {
    --   -- 'kiyoon/magick.nvim',
    --   'luarocks.nvim',
    -- },
    config = function()
      -- -- default config
      require('image').setup {
        backend = 'kitty',
        kitty_method = 'normal',
        processor = 'magick_cli', -- or "magick_rock"
        -- processor = 'magick_rock', -- or "magick_cli"
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = true,
            only_render_image_at_cursor_mode = 'popup',
            -- floating_windows = true, -- if true, images will be rendered in floating markdown windows
            filetypes = { 'vimwiki', 'quarto' }, -- markdown extensions (ie. quarto) can go here
            -- resolve_image_path = function(document_path, image_path, fallback)
            --   local obsidian_client = require('obsidian').get_client()
            --   -- Check if the image_path is already an absolute path, so far path start with ~ doesn't work by this approach
            --   if image_path:match '^/' then
            --     -- If it's an absolute path, leave it unchanged
            --     return image_path
            --   end
            --   -- Construct the new image path by prepending the Assets directory
            --   local new_image_path = obsidian_client:vault_relative_path(image_path).filename
            --   -- Check if the constructed path exists
            --   if vim.fn.filereadable(new_image_path) == 1 then
            --     return new_image_path
            --   else
            --     return fallback(document_path, image_path)
            --   end
            -- end,
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { 'norg' },
          },
          html = {
            enabled = false,
          },
          css = {
            enabled = false,
          },
        },
        -- max_width = 100,
        -- max_height = 12,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        max_width = nil,
        max_height = nil,
        -- max_width_window_percentage = nil,
        -- -- max_height_window_percentage = 50,
        -- window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', 'snacks_notif', 'scrollview', 'scrollview_sign' },
        editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
        -- tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.webp', '*.avif' }, -- render image files as images when opened
      }
      --   -- window_overlap_clear_enabled = true,
      --   -- window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
      --   -- editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
      -- }
    end,
    -- opts = {
    --   init = function()
    --     package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/magick/init.lua;'
    --     package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/magick/?.lua;'
    --     local ok, err = pcall(require, 'magick')
    --     if ok then
    --       print 'that worked'
    --     else
    --       print 'that failed'
    --     end
    --   end,
    -- },
    -- version = '1.1.0', -- or comment out for latest
  },
  { 'benlubas/image-save.nvim', cmd = 'SaveImage' },
  {
    'benlubas/molten-nvim',
    dependencies = { '3rd/image.nvim' },
    version = '^1.1.0',
    ft = { 'python', 'quarto' },
    build = ':UpdateRemotePlugins',
    init = function()
      -- this is an example, not a default. Please see the readme for more configuration options
      vim.g.molten_output_win_max_height = 12
      vim.g.molten_image_provider = 'image.nvim'
      -- vim.g.molten_use_border_highlights = true
      -- vim.g.molten_virt_text_output = false

      -- vim.g.molten_auto_init_behavior = 'init'
      vim.g.molten_enter_output_behavior = 'open_and_enter'
      -- vim.g.molten_output_win_max_height = 16
      -- vim.g.molten_output_win_cover_gutter = false
      -- vim.g.molten_output_win_border = 'single'
      -- vim.g.molten_output_win_style = 'minimal'
      -- vim.g.molten_auto_open_output = false
      -- vim.g.molten_output_show_more = true
      -- vim.g.molten_virt_text_max_lines = 16
      -- vim.g.molten_wrap_output = true

      vim.g.molten_auto_image_popup = true
      -- add a few new things

      -- don't change the mappings (unless it's related to your bug)
      vim.keymap.set('n', '<localleader>ii', ':MoltenInit<CR>', { desc = '[I]nit' })
      vim.keymap.set('n', '<localleader>ip', function()
        local venv = os.getenv 'VIRTUAL_ENV'
        if venv ~= nil then
          venv = string.match(venv, '/.+/(.+)')
          vim.cmd(('MoltenInit %s'):format(venv))
        else
          vim.cmd 'MoltenInit python3'
        end
      end, { desc = 'Init [P]ython3', silent = true })

      vim.keymap.set('n', '<localleader>ie', ':MoltenEvaluateOperator<CR>', { desc = '[E]valuate operator' })
      vim.keymap.set('n', '<localleader>ir', ':MoltenReevaluateCell<CR>', { desc = '[R]eevaluate cell' })
      vim.keymap.set('v', '<localleader>ir', ':<C-u>MoltenEvaluateVisual<CR>gv', { desc = '[R]un visual' })
      vim.keymap.set('n', '<localleader>io', ':noautocmd MoltenEnterOutput<CR>', { desc = '[O]utput enter' })
      vim.keymap.set('n', '<localleader>ih', ':MoltenHideOutput<CR>', { desc = '[H]ide output' })
      vim.keymap.set('n', '<localleader>id', ':MoltenDelete<CR>', { desc = '[D]elete' })
    end,
  },
  -- SymbolOutline
  {
    'hedyhli/outline.nvim',
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = { -- Example mapping to toggle outline
      { '<leader>co', '<cmd>Outline<CR>', desc = '[O]utline toggle' },
    },
    opts = {
      -- You providers
      providers = {
        priority = { 'markdown', 'lsp' },
        markdown = {
          filetypes = { 'markdown', 'quarto' },
        },
      },
    },
  },
  -- git conflict
  { 'akinsho/git-conflict.nvim', version = '*', event = 'BufReadPost', config = true },

  -- Sticky context: shows parent headings/functions at top of screen
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufReadPost',
    opts = {
      max_lines = 3,
      multiline_threshold = 1,
    },
    keys = {
      { '<leader>cx', '<cmd>TSContextToggle<CR>', desc = 'Toggle treesitter conte[X]t' },
    },
  },

  -- Auto-save on leaving insert mode or focus lost
  {
    'okuuva/auto-save.nvim',
    event = { 'InsertLeave', 'TextChanged' },
    opts = {
      debounce_delay = 3000,
      condition = function(buf)
        -- Don't auto-save special buffers
        local ft = vim.bo[buf].filetype
        if vim.tbl_contains({ 'oil', 'neo-tree', 'toggleterm', 'codecompanion' }, ft) then
          return false
        end
        return true
      end,
    },
  },
  --tree
  --indent line
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      local highlight = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowOrange',
        'RainbowGreen',
        'RainbowViolet',
        'RainbowCyan',
      }

      local hooks = require 'ibl.hooks'
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
        vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
        vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
        vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
      end)

      require('ibl').setup { indent = { highlight = highlight } }
    end,
  },
  {
    'karb94/neoscroll.nvim',
    event = 'WinScrolled',
    config = function()
      require('neoscroll').setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      }
    end,
  },
  {
    'nvzone/typr',
    dependencies = 'nvzone/volt',
    opts = {},
    cmd = { 'Typr', 'TyprStats' },
  },
  --project
  {
    'DrKJeff16/project.nvim',
    cmd = { -- Lazy-load by commands
      'Project',
      'ProjectAdd',
      'ProjectConfig',
      'ProjectDelete',
      'ProjectHistory',
      'ProjectRecents',
      'ProjectRoot',
      'ProjectSession',
    },
  },
  -- Comment handling
  {
    'numToStr/Comment.nvim',
    event = 'BufReadPost',
    opts = {
      -- add any options here
    },
  },
  --AI
  -- { 'Joakker/lua-json5' },
  {
    'olimorris/codecompanion.nvim',
    cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionActions', 'CodeCompanionCmd' },
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('codecompanion').setup {
        rocks = {
          enabled = false,
        },
        extensions = {
          mcphub = {
            callback = 'mcphub.extensions.codecompanion',
            opts = {
              make_tools = true,
              show_server_tools_in_chat = true,
              add_mcp_prefix_to_tool_names = false,
              show_result_in_chat = true,
              make_vars = false,
              make_slash_commands = true,
            },
          },
        },
        strategies = {
          chat = {
            adapter = 'kiro',
          },
          inline = { adapter = 'kiro' },
          agent = { adapter = 'kiro' },
        },
        display = {
          diff = {
            provider = 'mini_diff',
          },
        },
        opts = {
          log_level = 'DEBUG',
        },
        adapters = {
          acp = {
            kiro = function()
              -- Walk up from cwd to find .kiro/agents/*.json
              local dir = vim.fn.getcwd()
              while dir ~= '/' do
                local agent_files = vim.fn.glob(dir .. '/.kiro/agents/*.json', false, true)
                if #agent_files > 0 then
                  local name = vim.fn.fnamemodify(agent_files[1], ':t:r')
                  return require('codecompanion.adapters').extend('kiro', {
                    commands = { default = { 'bash', '-c', 'cd ' .. vim.fn.shellescape(dir) .. ' && exec kiro-cli acp --agent ' .. name } },
                  })
                end
                dir = vim.fn.fnamemodify(dir, ':h')
              end
              return require('codecompanion.adapters').extend('kiro', {})
            end,
            gemini_cli = function()
              return require('codecompanion.adapters').extend('gemini_cli', {
                defaults = {
                  -- auth_method = "gemini-api-key", -- "oauth-personal" | "gemini-api-key" | "vertex-ai"
                  auth_method = 'gemini-api-key',
                },
                env = {
                  -- GEMINI_API_KEY = vim.env.GEMINI_API_KEY,
                  -- api_key = 'cmd:pass show ai/gemini',
                  GEMINI_API_KEY = 'cmd:pass show ai/gemini',
                },
              })
            end,
          },
          http = {
            llm = function()
              --cclaude
              -- return require('codecompanion.adapters').extend('openai_compatible', {
              --   env = {
              --     url = 'https://mj.chatgptten.com', -- optional: default value is ollama url http://127.0.0.1:11434
              --     api_key = function()
              --       return os.getenv 'CLAUDE_API_KEY'
              --     end, -- optional: if your endpoint is authenticated
              --     chat_url = '/v1/chat/completions', -- optional: default value, override if different
              --   },
              --   schema = {
              --     model = {
              --       default = 'claude-3-5-sonnet-20241022',
              --     },
              --   },
              -- })
              --ollama
              return require('codecompanion.adapters').extend('ollama', {
                schema = {
                  model = {
                    -- default = 'deepseek-r1:8b',
                    default = 'hf.co/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:UD-Q5_K_XL',
                    -- default = 'llama3.2:3b',
                  },
                  num_ctx = {
                    default = 40960,
                  },
                  -- num_predict = {
                  --   default = -1,
                  -- },
                },
              })
            end,
          },
        },
      }
    end,
  },
  {
    'ravitemer/mcphub.nvim',
    cmd = { 'MCPHub' },
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    build = 'npm install -g mcp-hub@latest', -- Installs `mcp-hub` node binary globally
    config = function()
      require('mcphub').setup()
    end,
  },
  -- {
  --   'yetone/avante.nvim',
  --   event = 'VeryLazy',
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     provider = 'gemini-cli',
  --     acp_providers = {
  --       ['gemini-cli'] = {
  --         command = 'gemini',
  --         args = { '--experimental-acp' },
  --         env = {
  --           NODE_NO_WARNINGS = '1',
  --           GEMINI_API_KEY = 'cmd:pass show ai/gemini',
  --         },
  --         auth_method = 'gemini-api-key',
  --       },
  --     },
  --     providers = {
  --       -- dual_boost = {
  --       --   enabled = true,
  --       --   first_provider = 'ollama',
  --       --   second_provider = 'ELI',
  --       --   prompt = 'Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: {{provider1_output}}, Reference Output 2: {{provider2_output}}',
  --       --   timeout = 60000, -- Timeout in milliseconds
  --       -- },
  --       -- add any opts here
  --       ollama = {
  --         endpoint = '127.0.0.1:11434',
  --         model = 'hf.co/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:UD-Q5_K_XL',
  --         -- model = 'mistral',
  --         -- model = 'opencoder',
  --       },
  --       -- @type AvanteProvider --/// ELI
  --       -- ollama = {
  --       --   endpoint = os.getenv 'ELI_API_URL',
  --       --   api_key_name = 'ELI_API_KEY',
  --       --   model = 'qwen2.5-7b',
  --       --   -- model = 'mistral',
  --       --   -- model = 'opencoder',
  --       -- },
  --
  --       -- provider = 'cclaude', -- Recommend using Claude
  --       -- auto_suggestions_provider = 'cclaude', -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
  --       -- vendors = {
  --       --   cclaude = {
  --       --     __inherited_from = 'openai',
  --       --     endpoint = 'mj.chatgptten.com/v1',
  --       --     api_key_name = 'CLAUDE_API_KEY',
  --       --     model = 'claude-3-5-sonnet-20241022',
  --       --     temperature = 0,
  --       --     max_tokens = 4096,
  --       --   },
  --       -- },
  --     },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = 'make',
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     'stevearc/dressing.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --     --- The below dependencies are optional,
  --     'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
  --     'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  --     -- 'zbirenbaum/copilot.lua', -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       'HakonHarnes/img-clip.nvim',
  --       event = 'VeryLazy',
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           -- use_absolute_path = true,
  --         },
  --       },
  --     },
  --   },
  -- },
  -- using lazy.nvim
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        separator_style = 'slant',
        tab_size = 15,
      },
    },
    -- config = function()
    --   require('bufferline').setup {}
    -- end,
  },
  -- Better helpview for nvim
  {
    'OXY2DEV/helpview.nvim',
    lazy = false,
    opts = {
      preview = {
        icon_provider = 'mini', -- "mini" or "devicons"
      },
    },
  },

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Kiro quick term
local Terminal = require('toggleterm.terminal').Terminal
local kiro = Terminal:new {
  cmd = 'q',
  name = 'Kiro',
  count = 5,
  direction = 'float',
  float_opts = {
    border = 'double',
  },
}

function _kiro_toggle()
  kiro:toggle()
end

-- vim: ts=2 sts=2 sw=2 et
--
--  Yank paths
vim.keymap.set('n', '<leader>yp', function()
  vim.fn.setreg('+', vim.fn.expand '%:p:.')
end, { desc = 'File [P]ath' })
vim.keymap.set('n', '<leader>yd', function()
  vim.fn.setreg('+', vim.fn.expand '%:h')
end, { desc = '[D]irectory' })
vim.keymap.set('n', '<leader>yf', function()
  vim.fn.setreg('+', vim.fn.expand '%:t:r')
end, { desc = '[F]ile name' })
