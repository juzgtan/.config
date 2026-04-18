        -- Example in your Lazy.nvim spec file
        return {
          {
            "rachartier/tiny-inline-diagnostic.nvim",
            event = "BufReadPost", -- Load after buffer is read
            opts = {},
          },
        }
