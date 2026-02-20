return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup()

    local map = vim.keymap.set
    map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
    map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
    map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
  end,
}

