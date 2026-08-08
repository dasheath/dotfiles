local map = vim.keymap.set

-- Quick escape
map("i", "jk", "<Esc>")

-- Clear search highlight
map("n", "<leader>nh", "<cmd>nohlsearch<CR>")

-- Go back to netrw
map("n", "<leader>pv", ":Ex<CR>")

-- Telescope helpers
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")

-- Nvim-Tree helpers
map("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>")
map("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>")

