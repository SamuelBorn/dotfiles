return {
    "ibhagwan/fzf-lua",
    config = function()
        require("fzf-lua").setup({})


        local search = function()
            local cmd = ""
            for _, filepath in ipairs(vim.v.oldfiles) do
                cmd = cmd .. 'echo "' .. filepath .. '" && '
            end
            cmd = cmd .. "fd --color=never --type f --hidden --follow --exclude .git"
            for _, filepath in ipairs(vim.v.oldfiles) do
                cmd = cmd .. ' --exclude ' .. filepath
            end
            require("fzf-lua").files({ cmd = cmd })
        end

        require("fzf-lua").files({ cwd = "~/.config" })
        -- vim.keymap.set("n", "<c-P>",
        vim.keymap.set("n", "<c-P>", search, { desc = "Fzf Files" })
    end,
    keys = {
        { "<c-p>", require }
    }
}
