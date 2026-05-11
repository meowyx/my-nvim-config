vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.fillchars = { eob = " " }
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function() vim.opt.relativenumber = false end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function() vim.opt.relativenumber = true end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = "nc"
  end,
})

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.keymap.set("n", "x", '"_x', { desc = "Delete char without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>D", '"_D', { desc = "Delete to EOL without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"0p', { desc = "Paste from yank register" })
vim.keymap.set("n", "<leader>P", '"0P', { desc = "Paste before from yank register" })

require("discipline").cowboy()
