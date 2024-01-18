return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        require('telescope').load_extension('fzf')
    end,
    keys = {
        { '<leader>ff',       mode = 'n', function() require('telescope.builtin').find_files() end },
        { '<leader><leader>', mode = 'n', function() require('telescope.builtin').buffers() end },
        { '<leader>fh',       mode = 'n', function() require('telescope.builtin').help_tags() end },
        {
            '<leader>fe',
            mode = 'n',
            function()
                require('telescope.builtin').find_files(
                    { cwd = "~", search_dirs = { "~/Repos/", "~/Dropbox/" }, file_ignore_patterns = { "venv", "%.docx", "%.pyi", "%.pyc", "%.png", "%.jpg", "%.pdf", "%.svg", "%.note" }, })
            end
        },
    },
}
