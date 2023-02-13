-- Активация вещания готовых набросков 
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Инициализация "ms-jpq/coq_nvim"
local coq = require('coq')

-- Инициализация LSP-серверов

-- Инициализация "psalm" (LSP-сервер для PHP)
require('lspconfig').psalm.setup {
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities()
}

-- Инициализация "vscode-html-language-server" (готовый набросок для HTML)
require('lspconfig').html.setup {
  capabilities = capabilities
}
