-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.list = false

vim.opt.termguicolors = true
vim.opt.winblend = 0 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("osc52", { clear = true }),
  callback = function()
    -- vim.print(vim.v.event)
    if vim.v.operator == "y" then
      require("vim.ui.clipboard.osc52").copy("+")(vim.v.event.regcontents)
      -- require("osc52").copy_register("+")
    end
  end,
})

vim.opt.shiftwidth = 4 -- Size of an indent
