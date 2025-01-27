-- check if we need to reload the file when it changed (e.g. after git reset)
vim.api.nvim_create_autocmd({ "FocusGained", "TermLeave" }, {
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(event)
        local buf = event.buf
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- write changes when opening terminal
vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter" }, {
    command = "wa",
})

-- Open some windows in a vertical split by default
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "man" },
    command = "wincmd L",
})

-- Set makeprg for latex
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    command = "setlocal makeprg=texfot\\ pdflatex\\ %",
})

-- Show LSP status
vim.api.nvim_create_autocmd("LspProgress", {
    callback = function()
            vim.notify(vim.lsp.status(), vim.log.levels.TRACE, {
            id = "lsp_progress",
        })
    end,
})
