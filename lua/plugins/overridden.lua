return {
  {
    "folke/lazy.nvim",
    opts = function(opts)
      opts.rocks = {
        hererocks = false,
        enabled = false,
      }
    end,
  },
  {
    "toppair/peek.nvim",
    opts = function(_, opts) opts.app = "browser" end, -- "browser" or "webview"
  },
  {
    "max397574/better-escape.nvim",
    opts = function(plugin, opts)
      -- check if an `indent` table exists, if not, create it
      opts.mappings = opts.mappings or {}

      -- set mappings for each neovim mode
      for _, mode in ipairs { "i", "c", "t", "v", "s" } do
        opts.mappings[mode] = opts.mappings[mode] or {}
      end

      -- set the sub-keys for each mode
      local mappings = {
        i = { j = "<Esc>" },
        c = { j = "<Esc>" },
        t = { j = "<C-\\><C-n" },
        v = { j = "<Esc>" },
        s = { j = "<Esc>" },
      }

      for mode, mapping in pairs(mappings) do
        opts.mappings[mode].k = mapping
      end
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    enabled = false,
  },
}
