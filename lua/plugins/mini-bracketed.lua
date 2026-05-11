return {
  "echasnovski/mini.bracketed",
  event = "BufReadPost",
  config = function()
    require("mini.bracketed").setup({
      comment = { suffix = "" },
      diagnostic = { suffix = "" },
      file = { suffix = "" },
      window = { suffix = "" },
      quickfix = { suffix = "" },
      yank = { suffix = "" },
      treesitter = { suffix = "n" },
    })
  end,
}
