
-- Global options
vim.g.have_nerd_font = true

-- Line numbers
vim.wo.number = true
vim.o.relativenumber = true
vim.opt.numberwidth = 4 -- set number column width to 4
vim.wo.signcolumn = 'yes' -- always show sign column

-- 2-space identation
vim.opt.tabstop = 2         -- how many spaces a tab count for
vim.opt.shiftwidth = 2      -- identation width
vim.opt.expandtab = true    -- convert tabs to space
vim.opt.smartindent = true  -- smart auto indent
vim.opt.autoindent = true    -- copy indent from current line when starting a new line

-- Wrapping
vim.opt.wrap = false -- disable line wrapping
vim.opt.linebreak = true -- wrap on word boundary

-- UI
vim.opt.cursorline = true
vim.opt.termguicolors = true -- enable true color support

-- Clipboard
vim.opt.clipboard = 'unnamedplus' -- use system clipboard

-- Search behavior (quality of life)
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false -- don't highlight search results

-- Split behavior
vim.opt.splitright = true -- open vertical splits to the right
vim.opt.splitbelow = true -- open horizontal splits below

-- Scrolloff
vim.opt.scrolloff = 8 -- keep 8 lines visible when scrolling
vim.opt.sidescrolloff = 8 -- keep 8 columns visible when scrolling horizontally

-- Showmode
vim.opt.showmode = false -- don't show mode since we have a statusline plugin

-- Free line movement
vim.opt.whichwrap = 'bs<>[]hl' -- allow left/right movement to wrap to previous/next line

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Save undo history
vim.opt.undofile = true

-- Improve completion experience
vim.opt.completeopt = 'menuone,noselect' -- mostly just for cmp

-- Tab line (gentleman prefiere no usarlo... voy a dejarlo por ahora)
vim.opt.showtabline = 2 -- always show tab line

-- Backspace behavior
vim.opt.backspace = 'indent,eol,start' -- allow backspacing over indent, end of line, and start of insert

-- Popup menu size
vim.opt.pumheight = 10 -- pop up menu height

-- Concel level
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files

-- File enconding
vim.opt.encoding = 'utf-8' -- the encoding used inside neovim
vim.opt.fileencoding = 'utf-8' -- the encoding written to a file

-- More space for messages
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages

-- Break indent
vim.opt.breakindent = true -- maintain indent when wrapping lines

-- Decrease update time
vim.opt.updatetime = 250 -- faster completion

-- Time to wait a mapped sequence to complete (in milliseconds)
vim.opt.timeoutlen = 1000

-- Improve command line completion experience
vim.opt.shortmess:append "c" -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-" -- consider string-string as whole word

