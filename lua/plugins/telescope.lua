return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = false,
          mappings = {
            ["n"] = {
              ["N"] = function(...)
                return require("telescope").extensions.file_browser.actions.create(...)
              end,
              ["h"] = function(...)
                return require("telescope").extensions.file_browser.actions.goto_parent_dir(...)
              end,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
            },
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")

    vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<C-f>", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", ";f", function()
      builtin.find_files({ no_ignore = false, hidden = true })
    end, { desc = "Find files (incl hidden)" })
    vim.keymap.set("n", ";r", function()
      builtin.live_grep({ additional_args = { "--hidden" } })
    end, { desc = "Live grep (incl hidden)" })
    vim.keymap.set("n", "\\\\", builtin.buffers, { desc = "List open buffers" })
    vim.keymap.set("n", ";t", builtin.help_tags, { desc = "Help tags" })
    vim.keymap.set("n", ";;", builtin.resume, { desc = "Resume previous picker" })
    vim.keymap.set("n", ";e", builtin.diagnostics, { desc = "Diagnostics" })
    vim.keymap.set("n", ";s", builtin.treesitter, { desc = "Treesitter symbols" })
    vim.keymap.set("n", "<leader>fb", function()
      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = vim.fn.expand("%:p:h"),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 },
      })
    end, { desc = "File browser (current buffer dir)" })
  end,
}
