return {
    "ggandor/leap.nvim",
    opts = {},
    keys = {
        { "s", mode = "n", function() require('leap').leap({ target_windows = { vim.api.nvim_get_current_win() } }) end},
    },
}
