return {
  {
    "max397574/better-escape.nvim",
    opts = function(plugin, opts)
      -- check if an `indent` table exists, if not, create it
      if not opts.mappings then opts.mappings = {} end
      if not opts.mappings.i then opts.mappings.i = {} end
      if not opts.mappings.i then opts.mappings.c = {} end
      if not opts.mappings.i then opts.mappings.t = {} end
      if not opts.mappings.i then opts.mappings.v = {} end
      if not opts.mappings.i then opts.mappings.s = {} end
      -- once we know it is created, we can set the sub-keys
      opts.mappings.i.k = {
        -- These can all also be functions
        j = "<Esc>",
      }
      opts.mappings.c.k = {
        j = "<Esc>",
      }
      opts.mappings.t.k = {
        j = "<C-\\><C-n",
      }
      opts.mappings.v.k = {
        j = "<Esc>",
      }
      opts.mappings.s.k = {
        j = "<Esc>",
      }
    end,
  },
}
