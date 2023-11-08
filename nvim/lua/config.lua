vim.g.mapleader = ' '

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.number = true
vim.o.relativenumber = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.signcolumn = 'no'
vim.o.scrolloff = 8

vim.o.wrap = false

-- Always split windows vertically
vim.api.nvim_create_autocmd("WinNew", { command = "wincmd L" })

-- Set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
