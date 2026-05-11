return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    heading = {
      sign = false,
      width = "block",
      left_pad = 1,
      right_pad = 4,
      icons = { "\xf3\xb0\x89\xab ", "\xf3\xb0\x89\xac ", "\xf3\xb0\x89\xad ", "\xf3\xb0\x89\xae ", "\xf3\xb0\x89\xaf ", "\xf3\xb0\x89\xb0 " },
    },
    code = {
      width = "block",
      left_pad = 2,
      right_pad = 2,
      border = "thick",
      style = "full",
    },
    bullet = {
      icons = { "\xe2\x97\x8f", "\xe2\x97\x8b", "\xe2\x97\x86", "\xe2\x97\x87" },
    },
    checkbox = {
      unchecked = { icon = "\xf3\xb0\x84\xb1 " },
      checked = { icon = "\xf3\xb0\xb1\x92 " },
    },
    quote = {
      repeat_linebreak = true,
      icon = "\xe2\x96\x8c",
    },
    pipe_table = {
      style = "full",
      alignment_indicator = "\xe2\x94\x80",
    },
    link = {
      enabled = true,
      image = "\xf3\xb0\xa5\xb6 ",
      email = "\xf3\xb0\x8a\xab ",
      hyperlink = "\xf3\xb0\x8c\xb9 ",
    },
    dash = {
      icon = "\xe2\x94\x80",
      width = "full",
    },
  },
}
