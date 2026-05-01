return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      local palette = require("catppuccin.palettes").get_palette("mocha")
      vim.api.nvim_set_hl(0, "IblIndent", { fg = palette.surface2 })
    end)
    require("ibl").setup({
      indent = { char = "\xe2\x94\x82", highlight = "IblIndent" },
      scope = { enabled = false },
    })
  end,
}
