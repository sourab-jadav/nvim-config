vim.g.mapleader = " "
-- Set the initial window width for Netrw in vertical split mode
vim.g.netrw_winsize = 10
vim.keymap.set("n", "<leader>e","<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>q","<cmd>bd<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
--vim.keymap.set("x", "<leader>p", [["+p]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")



vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>n", "<cmd>bn<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>p", "<cmd>bp<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>ls", "<cmd>Mru<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
vim.keymap.set("n", "<leader>st", "<cmd>lcd %:p:h<CR>");
-- Map Ctrl+` to change the working directory to the file's directory
vim.api.nvim_set_keymap('n', "<leader>`", ':vsplit | :Ex|:lcd %:p:h|terminal<CR>', { noremap = true, silent = true })


vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)



--terminal
-- Define a key mapping in Terminal mode
--vim.api.nvim_set_keymap('t', '<C-q>', '<C-\\><C-n>:wincmd w<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-q>', '<C-\\><C-N>', { noremap = true }) --quiting from the terminal mode



vim.api.nvim_set_keymap('t', '<C-w>', '<C-\\><C-N><cmd>term bash -c "disown %1"<CR> ', { noremap = true })



--buffers
function Close_other_buffers()
    local current_bufnr = vim.fn.bufnr('%')
    for _, bufnr in ipairs(vim.fn.getbufinfo({ bufloaded = 1 })) do
        if bufnr.bufnr ~= current_bufnr then
            vim.api.nvim_command('silent! bdelete ' .. bufnr.bufnr)
        end
    end
end
vim.api.nvim_set_keymap('n', '<Leader>bda', ':lua Close_other_buffers()<CR>', { noremap = true, silent = true })





-- telescope
vim.api.nvim_set_keymap('n', '<leader>of', [[:Telescope oldfiles<CR>]], { noremap = true, silent = true })




--window management
-- Rotate to the previous window with Shift + L
vim.api.nvim_set_keymap('n', '<S-R>', ':wincmd w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-X>', ':wincmd x<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-L>', ':wincmd L<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F9>', ':wincmd =<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Q>', ':wincmd q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ss', ':split<Return>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<Return>', { noremap = true, silent = true })
