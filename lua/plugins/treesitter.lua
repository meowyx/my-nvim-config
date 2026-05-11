return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "rust", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "toml", "json", "javascript", "typescript" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
