return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "rust", "lua", "vim", "vimdoc", "markdown", "toml", "json", "javascript", "typescript" },
      highlight = { enable = true },
      indent = { enable = true },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function() pcall(vim.treesitter.stop) end,
    })
  end,
}
