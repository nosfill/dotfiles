return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  }
}
