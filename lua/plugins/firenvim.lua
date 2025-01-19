-- Adapted from: https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/recipes/vscode/init.lua
-- Credits to: https://github.com/conradbeach/dotfiles

if not vim.g.started_by_firenvim then return {} end -- Don't do anything in non-firenvim instances

local enabled = {}
vim.tbl_map(function(plugin) enabled[plugin] = true end, {
  "lazy.nvim",
  "firenvim",
  "AstroNvim",
  "astrocore",
  "vim-surround",
  "vim-repeat",
})

local Config = require "lazy.core.config"
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin) return enabled[plugin.name] end

---@type LazySpec
return {
  {
    "glacambre/firenvim",
    name = "firenvim",
    build = ":call firenvim#install(0)",
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        g = { -- configure vim.g variables
          firenvim_config = {
            localSettings = {
              [",*"] = {
                takeover = "never",
              },
            },
          },
        },
      },
    },
  },
}
