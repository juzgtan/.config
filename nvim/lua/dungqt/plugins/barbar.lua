return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- icons cho tabline
      "lewis6991/gitsigns.nvim",     -- gợi ý, để hiện icon Git trong tab
    },
    init = function()
      vim.g.barbar_auto_setup = false -- tắt auto setup để tự config
    end,
    opts = {
      animation = true,
      clickable = true,
      insert_at_end = true,
      maximum_padding = 2,
      icons = {
        buffer_index = true,
        buffer_number = false,
        button = "",
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = {enabled = true, icon = " "},
          [vim.diagnostic.severity.WARN]  = {enabled = true, icon = " "},
          [vim.diagnostic.severity.INFO]  = {enabled = true, icon = " "},
          [vim.diagnostic.severity.HINT]  = {enabled = true, icon = " "},
        },
        gitsigns = {
          added = {enabled = true, icon = "+"},
          changed = {enabled = true, icon = "~"},
          deleted = {enabled = true, icon = "-"},
        },
        separator = {left = "▎", right = ""},
        pinned = {button = "車", filename = true},
      },
    },
    version = "^1.0.0", -- đảm bảo dùng bản ổn định
  },
}
