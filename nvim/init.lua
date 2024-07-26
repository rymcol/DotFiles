local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true

require("vim-options")
require("lazy").setup({
  spec = {
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins" }, -- breaks nvim-tmux-navigation
    -- { import = "lazyvim.plugins.extras.dap.core" },    -- technically unnecessary
    { import = "plugins" },
  },
})

local function open_nvim_tree(data)
  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not real_file and not no_name then
    return
  end

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- autoclose filepane --
vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})

-- disable relative line numbers
vim.opt.relativenumber = false