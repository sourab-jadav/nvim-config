--
-- vim.api.nvim_exec([[:highlight Folded guibg=grey guifg=blue]], true)
--
--
-- vim.api.nvim_exec([[
--   let g:netrw_banner = 0
--   let g:netrw_winsize = 20
--   let g:netrw_liststyle = 3
--   let g:netrw_browse_split = 4
--   let g:netrw_altv = 1
--   let g:netrw_hide = 0
--   let g:netrw_fastbrowse = 0
-- ]], false)
--
--
-- function _G.toggle_netrw()
--   -- Check if netrw is active
--   local buf_type = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'filetype')
--   if buf_type == 'netrw' then
--         -- check if last
--         local win_count = #vim.api.nvim_tabpage_list_wins(0)
--         if win_count > 1 then
--                 -- If netrw is active, close the window
--                 vim.api.nvim_win_close(0, true)
--         end
--   else
--     -- If netrw is not active, open it
--     vim.cmd('Lexplore')
--   end
-- end
-- vim.cmd [[
--  command! Togglenet lua toggleMapping()
-- ]]
--
-- local nrwgroup = vim.api.nvim_create_augroup('AutoDeleteNetrwHiddenBuffers', {clear = true})
--
-- -- close netrw buffers automatically
-- vim.api.nvim_create_autocmd("FileType", {
--         pattern = "netrw",
--         group = nrwgroup,
--         command = "setlocal bufhidden=wipe"
-- })
--
-- -- need to figure out how to only open one netrw
--
-- vim.api.nvim_create_autocmd('filetype', {
--   pattern = 'netrw',
--   desc = 'Better mappings for netrw',
--   callback = function()
--     local bind = function(lhs, rhs)
--       vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
--     end
--     -- edit new file
--     bind('c', '%')
--     -- rename file
--     bind('r', 'R')
--   end
-- })