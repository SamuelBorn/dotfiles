-- check if we need to reload the file when it changed (e.g. after git reset)
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = vim.api.nvim_create_augroup("checktime", {}),
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("last_loc", {}),
    callback = function(event)
        local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    callback = function()
        vim.highlight.on_yank()
    end,
})
