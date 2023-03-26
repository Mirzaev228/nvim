-- Инициализация "neovim/nvim-lspconfig"
local lspconfig = require('lspconfig')

-- Активация вещания готовых набросков
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Инициализация "ms-jpq/coq_nvim"
local coq = require('coq')

-- Инициализация LSP-серверов

-- Инициализация "bmewburn/vscode-intelephense" (LSP-сервер для PHP)
lspconfig.intelephense.setup({
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})

-- Инициализация "hrsh7th/vscode-html-language-server" (LSP-сервер для HTML)
lspconfig.html.setup({
  init_options = {
    configurationSection = { 'html' },
    embeddedLanguages = {
      css = false,
      javascript = false
    },
    provideFormatter = true,
  },
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})

-- Инициализация "aca/emmet-ls" (LSP-сервер для HTML)
lspconfig.emmet_ls.setup({
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})

-- Инициализация "hrsh7th/vscode-langservers-extracted" (LSP-сервер для CSS)
lspconfig.cssls.setup({
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  },
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})

-- Инициализация "antonk52/cssmodules-language-server" (LSP-сервер для JS, вспомогательный для CSS)
lspconfig.cssmodules_ls.setup({
  init_options = {
    camelCase = false,
  },
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})

-- Инициализация "denoland/deno" (LSP-сервер для JavaScript и PostScript)
lspconfig.denols.setup({
  init_options = {
    enable = true,
    unstable = false
  },
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})

-- Инициализация "hrsh7th/vscode-langservers-extracted" (LSP-сервер для JSON)
lspconfig.jsonls.setup({
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})

-- Инициализация "luals/lua-language-server" (LSP-сервер для Lua)
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})
