return {
    'nvim-lualine/lualine.nvim',
    opts = {
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'diff' },
            lualine_c = { { 'filename', path = 3 } },
            lualine_x = { 'filetype' },
            lualine_y = {},
            lualine_z = { function() return string.format("%d ln", vim.api.nvim_buf_line_count(0)) end },
        },
    },
}
