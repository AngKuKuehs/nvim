return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add          = { text = "▎" },
      change       = { text = "▎" },
      delete       = { text = "▁" },
      topdelete    = { text = "▔" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" },
    },
    current_line_blame = false, -- Toggle with :Gitsigns toggle_current_line_blame
    -- Keymaps only exist in buffers gitsigns is tracking
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- Jump between hunks; in a diff window, fall back to built-in ]c / [c
      map("]h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, "Next hunk")
      map("[h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, "Previous hunk")

      map("<leader>gp", gs.preview_hunk_inline, "Preview hunk inline")
      map("<leader>gu", gs.reset_hunk, "Reset (undo) hunk")
      map("<leader>gb", gs.blame_line, "Blame current line")
    end,
  },
}

