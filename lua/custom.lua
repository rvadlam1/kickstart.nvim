-- custom.lua
-- Personal customizations on top of kickstart.nvim.
-- This file is sourced at the end of init.lua so it can safely override
-- anything set by the base config or its plugins.

-- ── Options ──────────────────────────────────────────────────────────

-- Enable Nerd Font icons
vim.g.have_nerd_font = true

-- Disable wrap-around when searching
vim.o.wrapscan = false

-- Scroll context: keep 5 lines above/below cursor (upstream default is 10)
vim.o.scrolloff = 5

-- Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- ── Keymaps ──────────────────────────────────────────────────────────

-- Keep search results at the top of the page
vim.api.nvim_set_keymap('n', 'n', 'nzt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzt', { noremap = true, silent = true })

-- ── Clangd LSP (only when compile_commands.json is present) ──────────
if vim.fn.filereadable 'compile_commands.json' == 1 then
  vim.lsp.config('clangd', {})
  vim.lsp.enable 'clangd'
end

-- ── Filetype overrides for XC16 GCC source tree ──────────────────────

-- .md files inside the GCC machine-description directories → treat as Lisp
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = '*/src/xc16_gcc_831/gcc/gcc/config/*/*.md',
  callback = function()
    vim.cmd 'set filetype=lisp'
  end,
})

-- .def files in the same tree → treat as C
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = '*/src/xc16_gcc_831/gcc/gcc/config/*/*.def',
  callback = function()
    vim.cmd 'set filetype=c'
  end,
})
