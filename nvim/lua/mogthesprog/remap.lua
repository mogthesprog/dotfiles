local which_key = require "which-key"
local builtin = require('telescope.builtin')

-- vim.api.nvim_create_autocmd("CursorHold", {
--   pattern = "*",
--   callback = vim.lsp.buf.signature_help,
--   desc = "auto hover on cursorhold",
-- })
--
-- vim.keymap.set("i", "<CursorHold>", vim.lsp.buf.hover)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
  callback = function(event)
    local buffer = event.buf

    which_key.add(
      {
        { "<leader>l",  buffer = buffer,              group = "LSP" },
        { "<leader>la", vim.lsp.buf.code_action,      buffer = buffer, desc = "Code action" },
        { "<leader>ld", vim.diagnostic.open_float,    buffer = buffer, desc = "Open diagnostic float" },
        { "<leader>ln", vim.lsp.buf.rename,           buffer = buffer, desc = "Rename" },
        { "<leader>lr", vim.lsp.buf.references,       buffer = buffer, desc = "References" },
        { "<leader>lw", vim.lsp.buf.workspace_symbol, buffer = buffer, desc = "Workspace symbol" },
        { "K",          vim.lsp.buf.hover,            buffer = buffer, desc = "Show hover information" },
        { "[d",         vim.diagnostic.goto_next,     buffer = buffer, desc = "Go to next diagnostic" },
        { "]d",         vim.diagnostic.goto_prev,     buffer = buffer, desc = "Go to previous diagnostic" },
        { "gd",         vim.lsp.buf.definition,       buffer = buffer, desc = "Go to definition" },
        { "gl",         vim.diagnostic.open_float,    buffer = buffer, desc = "Open diagnostic float" },
      }
    )


    -- https://www.mitchellhanberg.com/modern-format-on-save-in-neovim/
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = event.buf,
      callback = function()
        vim.lsp.buf.format { async = false, id = event.data.client_id }
      end

    })
  end,
})

which_key.add(
  {
    { "<C-d>",     "<C-d>zz",                                              desc = "Half page down and center" },
    { "<C-u>",     "<C-u>zz",                                              desc = "Half page up and center" },
    { "<leader>/", "<Plug>(comment_toggle_linewise_current)",              desc = "Toggle comment" },
    { "<leader>e", vim.cmd.Ex,                                             desc = "Open file explorer" },
    { "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Search and replace word under cursor" },
    { "<leader>t", ":Today<CR>",                                           desc = "Open today's note" },
    { "J",         "mzJ`z",                                                desc = "Join lines and keep cursor position" },
    { "N",         "Nzzzv",                                                desc = "Previous search result and center" },
    { "Q",         "<nop>",                                                desc = "Disable Ex mode" },
    { "n",         "nzzzv",                                                desc = "Next search result and center" },
  }
)

-- Telescope configuration
function vim.live_grep_todays_notes()
  local opts = {
    cwd = "~/workspace/notes",
  }
  require("telescope.builtin").live_grep(opts)
end

which_key.add(
  {
    { "<leader>f",  group = "Find" },
    { "<leader>ff", builtin.find_files,                                         desc = "Find files" },
    { "<leader>fn", vim.live_grep_todays_notes,                                 desc = "Find in notes" },
    { "<leader>fg", builtin.git_files,                                          desc = "Find git files" },
    { "<leader>fl", builtin.live_grep,                                          desc = "Live grep" },
    { "<leader>fp", ":lua require'telescope'.extensions.project.project{}<CR>", desc = "Find project" },
  }
)

-- Register the semicolon mapping separately as it doesn't use the leader prefix
which_key.add(
  {
    { ";", builtin.buffers, desc = "Find buffers" },
  }
)

which_key.add(
  {
    {
      mode = { "v" },
      { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle comment" },
      { "J",         ":m '>+1<CR>gv=gv",                       desc = "Move selection down" },
      { "K",         ":m '<-2<CR>gv=gv",                       desc = "Move selection up" },
    },
  }
)

--- Don't overwrite pastes in visual mode
-- vim.keymap.set("x", "<leader>p", "\"_dP")


-- Format command
-- vim.keymap.set("n", "<leader>f", function()
-- vim.lsp.buf.format()
-- end)

-- insert commands
vim.keymap.set('i', '<Right>', '<Right>', { noremap = true }) -- Make the right arrow behave normally in insert mode
