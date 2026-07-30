-- lua/plugins/gitsigns.lua

return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      current_line_blame = false,
    })

    local gs = require("gitsigns")

    vim.keymap.set("n", "]h", gs.next_hunk, {
      desc = "Next git hunk",
    })

    vim.keymap.set("n", "[h", gs.prev_hunk, {
      desc = "Previous git hunk",
    })

    vim.keymap.set("n", "<leader>hs", gs.stage_hunk, {
      desc = "Stage hunk",
    })

    vim.keymap.set("n", "<leader>hr", gs.reset_hunk, {
      desc = "Reset hunk",
    })

    vim.keymap.set("v", "<leader>hs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, {
      desc = "Stage selected hunk",
    })

    vim.keymap.set("v", "<leader>hr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, {
      desc = "Reset selected hunk",
    })

    vim.keymap.set("n", "<leader>hb", gs.blame_line, {
      desc = "Git blame current line",
    })

    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, {
      desc = "Preview hunk",
    })
  end,
}
