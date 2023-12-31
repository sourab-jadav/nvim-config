vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e",":Ex<CR>")
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

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "U", "<cmd>bn<CR>")
vim.keymap.set("n", "B", "<cmd>bp<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
vim.keymap.set("n", "<leader>st", "<cmd>lcd %:p:h<CR>");

function openTerm()
    vim.api.nvim_command('vsplit | :Ex | :lcd %:p:h | terminal')
    vim.cmd('startinsert')
end

-- Map a key to call the function, for example, <leader>`
vim.api.nvim_set_keymap('n', '<leader>`', [[:lua openTerm()<CR>]], { noremap = true, silent = true })


vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)



vim.api.nvim_set_keymap('t', '<C-q>', '<C-\\><C-N>', { noremap = true }) --quiting from the terminal mode



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
--window management
-- Rotate to the previous window with Shift + L
vim.api.nvim_set_keymap('n', 't', ':wincmd w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-X>', ':wincmd x<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-S-L>', ':wincmd L<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-S-K>', ':wincmd K<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-S-J>', ':wincmd J<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-S-H>', ':wincmd H<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F9>', ':wincmd =<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Q>', ':wincmd q<CR>', { noremap = true, silent = true })

-- splitting 
vim.api.nvim_set_keymap('n', 'ss', ':split<Return>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<Return>', { noremap = true, silent = true })

-- window navigation
vim.api.nvim_set_keymap('n', 'sh', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sl', ':wincmd l<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sj', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sk', ':wincmd k<CR>', { noremap = true, silent = true })

--working with tabs
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>',':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-v>', ':tabprevious<CR>', { noremap = true, silent = true })

