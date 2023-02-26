-- Инициализация "neovim/nvim-lspconfig"
local lspconfig = require('lspconfig')

-- Активация вещания готовых набросков 
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Инициализация "ms-jpq/coq_nvim"
local coq = require('coq')

-- Инициализация LSP-серверов

-- Инициализация "intelephense" (LSP-сервер для PHP)
lspconfig.intelephense.setup({
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})

-- Инициализация "vscode-html-language-server" (LSP-сервер для HTML)
lspconfig.html.setup({
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})

-- Инициализация "vscode-html-language-server" (LSP-сервер для CSS)
lspconfig.cssls.setup({
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})

-- Инициализация "vscode-langservers-extracted" (LSP-сервер для JavaScript и PostScript)
lspconfig.denols.setup({
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})

-- Инициализация "vscode-langservers-extracted" (LSP-сервер для JSON)
lspconfig.jsonls.setup({
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})
