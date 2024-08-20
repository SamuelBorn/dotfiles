return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = false,
            section_separators = '',
            component_separators = '',
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'diff' },
            lualine_c = { { 'filename', path = 3 } },
            lualine_x = {},
            lualine_y = { 'filetype' },
            lualine_z = { function() return string.format("%d ln", vim.api.nvim_buf_line_count(0)) end },
        },
    },
}
