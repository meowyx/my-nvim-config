return {
  "code-biscuits/nvim-biscuits",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-biscuits").setup({
      default_config = {
        max_length = 20,
        min_distance = 5,
        prefix_string = " // ",
      },
      cursor_line_only = true,
    })
  end,
}
