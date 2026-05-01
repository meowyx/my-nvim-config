return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local palette = require("catppuccin.palettes").get_palette("mocha")
    local theme = require("lualine.themes.catppuccin-mocha")
    theme.normal.a.bg = palette.pink
    theme.normal.a.fg = palette.base
    theme.insert.a.bg = palette.green
    theme.visual.a.bg = palette.mauve
    theme.replace.a.bg = palette.red
    theme.command.a.bg = palette.peach

    local hexagon = "\xe2\xac\xa2"

    local lsp_clients = function()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients == 0 then
        return ""
      end
      local names = {}
      for _, c in ipairs(clients) do
        table.insert(names, c.name)
      end
      return hexagon .. " " .. table.concat(names, ", ")
    end

    require("lualine").setup({
      options = {
        theme = theme,
        section_separators = { left = "\xee\x82\xb4", right = "\xee\x82\xb6" },
        component_separators = { left = "\xee\x82\xb1", right = "\xee\x82\xb3" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = {
          { "filename", icon = hexagon },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = "\xe2\x97\x8f ", warn = "\xe2\x97\x8f ", info = "\xe2\x97\x8f ", hint = "\xe2\x97\x8f " },
          },
          { lsp_clients },
          { "filetype", icon = { hexagon, align = "left" } },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
