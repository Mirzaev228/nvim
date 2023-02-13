-- Инициализация "ms-jpq/coq_nvim"
local coq = require('coq')

-- Инициализация LSP-серверов

-- Настройка и инициализация "psalm" (LSP-сервер для PHP)
require('lspconfig').psalm.setup {
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities()
}
