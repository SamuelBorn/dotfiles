-- Split window vertically
vim.keymap.set("n", "<leader>v", "<C-w>v")

-- Close windows
vim.keymap.set("n", "<leader>q", "<C-w>q")
vim.keymap.set("n", "<leader>o", "<C-w>o")

-- Move to window using the <ctrl>+hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- Centered Jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Go to complete end and beginnng of file
vim.keymap.set({ "n", "v" }, "gg", "gg0")
vim.keymap.set({ "n", "v" }, "G", "G$")

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')

-- Paste over selection without loosing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete without going into nvim clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Surround visual selection
vim.keymap.set("v", "(", "c()<esc>P<right>%")
vim.keymap.set("v", "[", "c[]<esc>P<right>%")
vim.keymap.set("v", "{", "c{}<esc>P<right>%")
vim.keymap.set("v", "'", "c''<esc>P<right>%")
vim.keymap.set("v", '"', 'c""<esc>P<right>%')

-- Ctrl + s to save
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>")

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
