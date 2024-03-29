-- Useful custom keymaps
vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("n", "<leader>q", vim.cmd.quit)
vim.keymap.set("n", "<leader>o", vim.cmd.only)

-- Split window
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>h", vim.cmd.split)

-- Move to window using the <ctrl>+hjkl
vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>wincmd h<cr>")
vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>wincmd j<cr>")
vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd>wincmd k<cr>")
vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>wincmd l<cr>")

-- Resize window using <ctrl> arrow keys
vim.keymap.set({ "n", "t" }, "<C-Up>", "<cmd>resize +2<cr>")
vim.keymap.set({ "n", "t" }, "<C-Down>", "<cmd>resize -2<cr>")
vim.keymap.set({ "n", "t" }, "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set({ "n", "t" }, "<C-Right>", "<cmd>vertical resize +2<cr>")

-- Go to complete end and beginnng of file
vim.keymap.set({ "n", "v" }, "gg", "gg0")
vim.keymap.set({ "n", "v" }, "G", "G$")

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')

-- Delete without overriding nvim clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set("n", "<leader>D", '"_D')

-- Show diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Leave terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
