-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`

-- Disable the built-in LazyVim spellcheck autocmd group
-- This must be done after LazyVim loads its autocmds
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    pcall(vim.api.nvim_del_augroup_by_name, "lazyvim_wrap_spell")
  end,
  desc = "Remove LazyVim spell check autocmd group",
})

-- Create custom markdown configuration without spell checking
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "md" },
  callback = function()
    -- Keep text wrapping but disable spell checking
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
    vim.opt_local.spelllang = {}

    -- Disable treesitter spell highlighting for markdown if available
    local ok, query = pcall(vim.treesitter.query.get, "markdown", "highlights")
    if ok and query then
      pcall(function()
        query.query:disable_capture("spell")
      end)
    end
  end,
  desc = "Configure markdown files without spell checking",
})
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
