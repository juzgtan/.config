return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  event = "VeryLazy",
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        border = "rounded",
      },
      max_concurrent_installers = 10,
    })

    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "lua_ls", -- Lua
        "pyright", -- Python
        "ts_ls", -- TypeScript/JavaScript
        "jsonls", -- JSON
        "yamlls", -- YAML
        "html", -- HTML
        "cssls", -- CSS
        "clangd", -- C/C++
        "marksman", -- Markdown
      },
      handlers = {
        -- Handler mặc định cho tất cả servers
        function(server_name)
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              -- Format on save
              if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                  group = vim.api.nvim_create_augroup("Format_" .. tostring(bufnr), { clear = true }),
                  buffer = bufnr,
                  callback = function()
                    vim.lsp.buf.format()
                  end,
                })
              end
            end,
          })
        end,

        -- Handler riêng cho lua_ls
        ["lua_ls"] = function()
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
            },
          })
        end,

        -- Handler riêng cho pyright
        ["pyright"] = function()
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          require("lspconfig").pyright.setup({
            capabilities = capabilities,
            settings = {
              python = {
                analysis = {
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
                  diagnosticMode = "workspace",
                },
              },
            },
          })
        end,
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",   -- Lua formatter
        "prettier", -- JS/TS/JSON/YAML formatter
        "eslint_d", -- JS/TS linter
        "shellcheck", -- Shell linter
        "markdownlint", -- Markdown linter
      },
      auto_update = true,
      run_on_start = true,
    })
  end,
}
