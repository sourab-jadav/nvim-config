
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search=vim.fn.input("Grep > ")});
end)

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules",
     -- '^[^.]*$'
    }
  },
}
vim.api.nvim_set_keymap('n', '<leader>of', [[:Telescope oldfiles<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tb', [[:Telescope buffers<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tsb', [[:Telescope current_buffer_fuzzy_find<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tk', [[:Telescope keymaps<CR>]], { noremap = true, silent = true })

