local coq = require('coq')

require('lspconfig').psalm.setup {
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities()
}
