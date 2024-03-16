require('sourab.remap');
require('sourab.packer');
require('sourab.set');
require('sourab.snippets');
--vim.cmd('colorscheme desert')

-- autoloading views
vim.api.nvim_exec([[
  autocmd BufWinLeave *.cpp mkview
  autocmd BufWinEnter *.cpp silent! loadview
]], false)

vim.api.nvim_exec([[:highlight Folded guibg=grey guifg=blue]], true)
