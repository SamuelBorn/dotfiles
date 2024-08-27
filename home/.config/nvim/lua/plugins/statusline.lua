return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            section_separators = '',
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'diff' },
            lualine_c = { { 'filename', path = 3 } },
            lualine_x = { 'filetype' },
            lualine_y = { function() return string.format("%d ln", vim.api.nvim_buf_line_count(0)) end },
            lualine_z = {},
        },
    },
}
