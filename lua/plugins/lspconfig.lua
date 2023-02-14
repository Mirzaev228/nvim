-- Инициализация "neovim/nvim-lspconfig"
local lspconfig = require('lspconfig')

-- Активация вещания готовых набросков 
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Инициализация "ms-jpq/coq_nvim"
local coq = require('coq')

-- Инициализация LSP-серверов

-- Инициализация "psalm" (LSP-сервер для PHP)
lspconfig.psalm.setup {
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities()
}

-- Инициализация "vscode-html-language-server" (готовый набросок для HTML)
lspconfig.html.setup {
  on_attach = lspconfig_on_attach,
  capabilities = capabilities
}

-- Инициализация "vscode-langservers-extracted" (готовый набросок для JavaScript и PostScript)
lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    -- Инициализация команды "EslintFixAll"
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })

    -- Вызов глобальной функции
    lspconfig_on_attach(client, bufnr)
  end,
})
