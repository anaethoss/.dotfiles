-- Servernames added from https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
local servers = {
  "lua_ls",
  "bashls",
  "cssls",
  "cssmodules_ls",
  "css_variables",
  "dockerls",
  "docker_compose_language_service",
  "eslint",
  "emmet_language_server",
  "gopls",
  "graphql",
  "html",
  "htmx",
  "jsonls",
  "tsserver",
  "remark_ls", -- Markdown
  "pylsp",
  "rust_analyzer",
  "sqlls",
  "stylelint_lsp",
  "taplo",
  "tailwindcss",
  "terraformls",
  "yamlls",
}

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = " ",
          package_pending = " ",
          package_uninstalled = " ",
        },
        border = "single",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint_d", -- js/ts linter
      },
    },
    config = function(_, opts)
      require("mason-tool-installer").setup(opts)
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = servers,
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      -- Add additional capabilities supported by nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local keymap = vim.keymap -- for conciseness

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf, silent = true }

          -- set keybinds
          opts.desc = "Show LSP references"
          keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

          opts.desc = "Go to declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

          opts.desc = "Show LSP definitions"
          keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

          opts.desc = "Show LSP implementations"
          keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

          opts.desc = "Show LSP type definitions"
          keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

          opts.desc = "See available code actions"
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

          opts.desc = "Smart rename"
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

          opts.desc = "Show buffer diagnostics"
          keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

          opts.desc = "Show line diagnostics"
          keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

          opts.desc = "Go to previous diagnostic"
          keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

          opts.desc = "Go to next diagnostic"
          keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

          opts.desc = "Show documentation for what is under cursor"
          keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

          opts.desc = "Restart LSP"
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end,
      })

      -- local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
      local signs = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = {
          prefix = "",
        },
        signs = true,
        underline = true,
        -- update_in_insert = false,

        float = {
          border = "single",
        },
      })

      -- lsps with default config
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          -- on_attach = on_attach,
          -- on_init = on_init,
          capabilities = capabilities,
        })
      end
    end,
  },
}
