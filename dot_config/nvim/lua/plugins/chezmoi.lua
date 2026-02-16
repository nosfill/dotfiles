return {
  {
    "xvzc/chezmoi.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("chezmoi").setup({
        edit = {
          watch = false,
          force = false,
        },
        events = {
          on_open = {
            notification = {
              enabled = true,
              timeout = 3000,
            },
          },
        },
      })
    end,
  },
}
