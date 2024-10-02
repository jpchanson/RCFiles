vim.o.backup = false -- creates a backup file
vim.o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.completeopt = {"menu", "menuone", "noselect"} -- mostly just for cmp
vim.o.fileencoding = "utf-8" -- the encoding written to a file
vim.o.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.o.ignorecase = true -- ignore case in search patterns
vim.o.mouse = "a" -- allow the mouse to be used in neovim
vim.o.pumheight = 8 -- pop up menu height
vim.o.pumblend = 10 -- transparency of pop-up menu
vim.o.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.o.smartcase = true -- smart case
vim.o.smartindent = true -- make indenting smarter again
vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window
vim.o.swapfile = false -- creates a swapfile
vim.o.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.undofile = true -- enable persistent undo
vim.o.updatetime = 100 -- faster completion (4000ms default)i
vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.expandtab = true -- convert tabs to spaces
vim.o.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.o.tabstop = 4 -- insert 2 spaces for a tab
vim.o.cursorline = true -- highlight the current line
vim.o.number = true -- set numbered lines
vim.o.relativenumber = true -- set relative numbered lines
vim.o.numberwidth = 4 -- set number column width to 4 {default 4}
vim.o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.o.wrap = true-- display lines as one long line
vim.o.scrolloff = 8 -- minimal number of columns to scroll horizontally.
vim.o.sidescrolloff = 8 -- minimal number of screen columns
vim.o.lazyredraw = true -- Won't be redrawn while executing macros, register and other commands.
vim.o.termguicolors = true -- Enables 24-bit RGB color in the TUI:
vim.opt.colorcolumn = "81,101"
vim.o.foldmethod = "indent"
vim.o.foldlevel = 8


require('plugins')
vim.cmd([[colorscheme onedark]])
require('keys')
require('lsp')
require('autocompletion')
require('dapCfg')
require('git')
require('colourscheme')
