-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.completion.copilot-cmp" },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.docker.lazydocker" },
  { import = "astrocommunity.editing-support.chatgpt-nvim" },
  { import = "astrocommunity.editing-support.copilotchat-nvim" },
  { import = "astrocommunity.editing-support.suda-vim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.remote-development.remote-sshfs-nvim" },
  -- import/override with your plugins folder
}
