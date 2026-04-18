return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(client, bufnr)
      -- Keymaps
      local opts = { buffer = bufnr, remap = false }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<F3>", vim.lsp.buf.code_action, opts)

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
    end

    -- Dùng API mới: vim.lsp.config
    -- Lua
    vim.lsp.config.lua_ls = {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
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
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- Python
    vim.lsp.config.pyright = {
      cmd = { "pyright", "--stdio" },
      filetypes = { "python" },
      root_markers = { "pyproject.toml", "setup.py", ".git" },
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "workspace",
          },
        },
      },
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- TypeScript/JavaScript
    vim.lsp.config.ts_ls = {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- Clangd (C/C++)
    vim.lsp.config.clangd = {
      cmd = { "clangd" },
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      root_markers = {
        ".clangd",
        ".git",
        "compile_commands.json",
        "compile_flags.txt",
        "CMakeLists.txt",
        "Makefile",
      },
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        clangd = {
          -- Các option cho clangd
          arguments = {
            "--background-index",    -- Index code trong background
            "--clang-tidy",          -- Bật clang-tidy
            "--completion-style=detailed", -- Chi tiết completion
            "--header-insertion=iwyu", -- Include what you use
            "--header-insertion-decorators",
            "--pch-storage=memory",  -- Lưu PCH trong memory
            "--log=error",           -- Chỉ log lỗi
          },
          inlayHints = {
            enabled = true, -- Hiện hint parameter
          },
        },
      },
    }

    -- JSON
    vim.lsp.config.jsonls = {
      cmd = { "vscode-json-language-server", "--stdio" },
      filetypes = { "json", "jsonc" },
      root_markers = { ".git", "package.json" },
      settings = {
        json = {
          validate = { enable = true },
          schemas = {
            {
              fileMatch = { "package.json" },
              url = "https://json.schemastore.org/package.json",
            },
          },
        },
      },
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- YAML
    vim.lsp.config.yamlls = {
      cmd = { "yaml-language-server", "--stdio" },
      filetypes = { "yaml", "yml" },
      root_markers = { ".git", ".yamllint" },
      settings = {
        yaml = {
          schemaStore = { enable = true },
          validate = true,
        },
      },
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- Enable các servers
    vim.lsp.enable({
      "lua_ls",
      "pyright",
      "ts_ls",
      "jsonls",
      "yamlls",
    })

    -- Auto start LSP khi mở file
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "lua", "python", "javascript", "typescript", "json", "yaml" },
      callback = function(args)
        local server_map = {
          lua = "lua_ls",
          python = "pyright",
          javascript = "ts_ls",
          typescript = "ts_ls",
          json = "jsonls",
          yaml = "yamlls",
        }
        local server = server_map[args.match]
        if server and vim.lsp.config[server] then
          vim.lsp.start(vim.lsp.config[server])
        end
      end,
    })
  end,
}
