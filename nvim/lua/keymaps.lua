-- Close (other) windows
vim.keymap.set('n', '<leader>q', '<C-w>q')
vim.keymap.set('n', '<leader>o', '<C-w>o')

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>')
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>')
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>')
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>')

-- Centered Jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Splitting
vim.keymap.set('n', '<leader>v', '<C-w>v')

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Paste over selection without loosing clipboard
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Delete without going into nvim clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- Surround visual selection
vim.keymap.set('v', '(', 'c()<esc>P<right>%')
vim.keymap.set('v', '[', 'c[]<esc>P<right>%')
vim.keymap.set('v', '{', 'c{}<esc>P<right>%')
vim.keymap.set('v', "'", "c''<esc>P<right>%")
vim.keymap.set('v', '"', 'c""<esc>P<right>%')

-- Goto diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Append next line to current without moving cursor
vim.keymap.set('n', 'J', 'mzJ`z')

-- Open open file explorer
vim.keymap.set('n', '<leader>ex', '<cmd>Explore<cr>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Go to complete end and beginnng of file
vim.keymap.set('n', 'gg', 'gg0')
vim.keymap.set('n', 'G', 'G$')
