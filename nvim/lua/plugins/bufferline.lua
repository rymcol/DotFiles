return {
    'akinsho/bufferline.nvim', 
    version = "*",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    modified_icon = "●",
    config = function()
        require("bufferline").setup{
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Explorer",
                        separator = true,
                        highlight = "Directory",
                        text_align = "left",
                    }
                },
            }
        }
    end
}
