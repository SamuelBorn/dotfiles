return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = false,
        },
        sections = {
            lualine_c = { { 'filename', path = 3 } }
        },
    },
}
