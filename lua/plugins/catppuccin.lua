return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        keywords = { "bold" },
      },
      integrations = {
        treesitter = true,
        markdown = true,
        cmp = true,
        gitsigns = true,
        telescope = { enabled = true },
        neotree = true,
        which_key = true,
        notify = true,
        mason = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
    })
  end,
}
