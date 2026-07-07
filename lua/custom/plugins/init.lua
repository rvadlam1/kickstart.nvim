-- Custom plugins
-- Add your own plugins here using vim.pack.add.

vim.pack.add { 'https://github.com/tpope/vim-fugitive' }
vim.pack.add { 'https://github.com/sindrets/diffview.nvim' }

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end
