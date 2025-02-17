return {
  'VVoruganti/today.nvim',
  -- dir = vim.fn.stdpath('config') .. '/lua/today',
  config = function()
    require('today').setup({
      local_root = os.getenv("HOME") .. "/.config/today",
      template = "templates/jrnl.md"
    })
  end

}
