vim.cmd.colorscheme("tokyonight")

vim.opt.clipboard = 'unnamedplus' -- use system keyboard for yank

vim.opt.nu = true                 -- set line numbers -- set line numbers
vim.opt.relativenumber = true     -- use relative line numbers

-- set tab size to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.incsearch = true -- incremental search

vim.opt.termguicolors = true

vim.opt.mouse = ""


local spell_types = {
  "text", "plaintex", "typst", "gitcommit", "markdown",
}

vim.opt.spelllang = { 'en_gb' }
vim.opt.spell = false
vim.api.nvim_create_augroup("Spellcheck", { clear = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "Spellcheck",
  pattern = spell_types,
  callback = function()
    vim.opt_local.spell = true
  end,
  desc = "Enable spellcheck for defined filetypes",
})

vim.opt.updatetime = 1000
