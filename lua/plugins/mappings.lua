return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- Normal mode mappings
        n = {
          -- Escape shortcut
          kj = { "<esc>", desc = "Escape" },

          -- Change to buffer's directory
          ["<leader>bi"] = { "<cmd>AstroRootInfo<CR>", desc = "AstroRoot Buffer's Directory Info" },
          ["<leader>bR"] = { "<cmd>AstroRoot<CR>", desc = "AstroRoot to Buffer's Directory" },

          -- Open LazyGit in buffer's directory
          ["<leader>gG"] = {
            function()
              local buffer_dir = vim.fn.expand "%:p:h" -- Get the buffer's directory
              if buffer_dir and buffer_dir ~= "" then
                vim.cmd("cd " .. buffer_dir) -- Change to buffer's directory
                require("astrocore").toggle_term_cmd { cmd = "lazygit", direction = "float" } -- Open LazyGit
              else
                vim.notify("No directory associated with the current buffer.", vim.log.levels.WARN)
              end
            end,
            desc = "Open LazyGit in Buffer's Git Context",
          },
          ["<Leader>M"] = { desc = "Markdown" },
          ["<Leader>Mp"] = { "<cmd>PeekOpen<cr>", desc = "Open Peek Preview" },
          ["<Leader>MP"] = { "<cmd>PeekClose<cr>", desc = "Open Peek Preview" },
        },
        t = {
          -- Terminal mode mappings (optional, disable if not needed)
        },
      },
    },
  },
}
