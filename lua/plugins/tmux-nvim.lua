return {
  {
    {
      "aserowy/tmux.nvim",
      version = "*",
      config = function() return require("tmux").setup() end,
    },
  },
}
