return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,

            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {
      desc = "Toggle file explorer",
    })

    vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeFindFile<CR>", {
      desc = "Find current file in explorer",
    })
  end,
}
