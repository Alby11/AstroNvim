return {
  {
    {
      "aserowy/tmux.nvim",
      version = "*",
      config = function() vim.g.baleia = require("tmux").setup {} end,
    },
  },
}
