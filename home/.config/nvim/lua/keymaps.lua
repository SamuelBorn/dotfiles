-- Save and quit
vim.keymap.set("n", "<leader>w", "<cmd>wa<cr>")
vim.keymap.set("n", "<leader>q", vim.cmd.quit)
vim.keymap.set("n", "<leader>o", vim.cmd.only)

-- Select all
vim.keymap.set({ "n", "x" }, "<C-a>", "<Esc>ggVG")

-- Execute lua code
vim.keymap.set("n", "<leader>x", ":.lua<cr>")
vim.keymap.set("v", "<leader>x", ":lua<cr>")

-- Yank to system clipboard
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')
vim.keymap.set("n", "<A-y>", '<cmd>%y+<cr>')

-- Save file with sudo permissions
vim.keymap.set("ca", "w!!", "w !sudo tee % > /dev/null")

-- Replace current selection
vim.keymap.set("x", "<leader>r", '"zy:%s/<C-r>z//g<left><left>')

-- Indent file with
vim.keymap.set("n", "<leader>L", "gg=G<C-o>")

-- Unhighlight search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Remove annoying keymap
vim.keymap.set("x", "J", "j")

-- Buffer management
vim.keymap.set({ "n", "t", "x" }, "H", "<cmd>bprevious<cr>")
vim.keymap.set({ "n", "t", "x" }, "L", "<cmd>bnext<cr>")

-- Move lines up and down
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==")
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==")
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv")
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv")

-- Better j k in wrapped lines (10j still behaves like j)
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Jump centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Window management
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>h", vim.cmd.split)
vim.keymap.set({ "n", "t" }, "<C-h>", function() vim.cmd.wincmd("h") end)
vim.keymap.set({ "n", "t" }, "<C-j>", function() vim.cmd.wincmd("j") end)
vim.keymap.set({ "n", "t" }, "<C-k>", function() vim.cmd.wincmd("k") end)
vim.keymap.set({ "n", "t" }, "<C-l>", function() vim.cmd.wincmd("l") end)
vim.keymap.set({ "n", "t" }, "<C-Up>", "<cmd>resize +2<cr>")
vim.keymap.set({ "n", "t" }, "<C-Down>", "<cmd>resize -2<cr>")
vim.keymap.set({ "n", "t" }, "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set({ "n", "t" }, "<C-Right>", "<cmd>vertical resize +2<cr>")
