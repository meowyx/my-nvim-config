return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({})

    vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Prev buffer" })
    vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { silent = true, desc = "Next buffer" })
    vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { silent = true, desc = "Close buffer" })
  end,
}
