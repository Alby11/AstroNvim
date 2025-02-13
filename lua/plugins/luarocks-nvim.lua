return {
  "vhyrro/luarocks.nvim",
  ft = { "lua" }, -- only load on lua filetype
  priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
  config = true,
  opts = {
    rocks = { "pathlib.nvim ~> 1.0" }, -- specifies a list of rocks to install
    -- luarocks_build_args = { "--with-lua=/my/path" }, -- extra options to pass to luarocks's configuration script
  },
}
