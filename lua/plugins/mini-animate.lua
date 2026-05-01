return {
  "echasnovski/mini.animate",
  event = "VeryLazy",
  opts = function()
    local animate = require("mini.animate")
    return {
      cursor = { enable = false },
      scroll = {
        timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
      },
      resize = {
        timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
      },
    }
  end,
}
