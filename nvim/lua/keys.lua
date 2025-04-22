vim.g.mapleader = ' '

-- Movement
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-j>', '<C-W>j')
vim.keymap.set('n', '<C-k>', '<C-W>k')
vim.keymap.set('n', '<C-l>', '<C-W>l')

-- F keys
vim.keymap.set('n', '<F1>', '<Cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<F3>', '<Cmd>bp<cr>')
vim.keymap.set('n', '<F4>', '<Cmd>bn<cr>')

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.current_buffer_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})

-- toggleterm
vim.keymap.set('n', '<leader>tt', [[<Cmd>ToggleTerm<cr>]], opts)
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<leader>qq', [[<Cmd>ToggleTerm<CR>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- LSP
--vim.api.nvim_create_autocmd('LspAttach', {
--    desc = 'LSP Actions',
--    callback = function(event)
--        local opts = {bufer = event.buf}
--            vim.api.nvim_set_keymap("n", "L", "<cmd>lua vim.diagnostic.open_float()<CR>")
--            vim.keymap.set('n', '<leader>K', "<cmd>lua vim.lsp.buf.hover()<CR>", {})
--}
