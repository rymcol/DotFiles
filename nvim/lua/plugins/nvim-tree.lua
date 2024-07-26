return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                side = "left",
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
                custom = {},
                exclude = {}
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 400,
            },
        })
        vim.keymap.set("n", "<C-n>", ":NvimTreeOpen<CR>", {})
    end,
}
