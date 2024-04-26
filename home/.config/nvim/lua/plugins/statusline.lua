return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = false,
        },
        sections = {
            lualine_c = { { 'filename', path = 3 } },
            lualine_x = {},
            lualine_z = { function() return string.format("%d ln", vim.api.nvim_buf_line_count(0)) end }
        },
    },
}
