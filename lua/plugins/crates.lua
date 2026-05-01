return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    require("crates").setup({
      completion = {
        cmp = { enabled = true },
      },
    })

    local cmp = require("cmp")
    cmp.setup.filetype("toml", {
      sources = cmp.config.sources({
        { name = "crates" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }),
    })

    vim.keymap.set("n", "<leader>ct", function() require("crates").toggle() end, { desc = "Crates: toggle" })
    vim.keymap.set("n", "<leader>cu", function() require("crates").update_crate() end, { desc = "Crates: update one" })
    vim.keymap.set("n", "<leader>cU", function() require("crates").upgrade_all_crates() end, { desc = "Crates: upgrade all" })
    vim.keymap.set("n", "<leader>cv", function() require("crates").show_versions_popup() end, { desc = "Crates: versions" })
    vim.keymap.set("n", "<leader>cf", function() require("crates").show_features_popup() end, { desc = "Crates: features" })
  end,
}
