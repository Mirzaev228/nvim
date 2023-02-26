-- Инициализация настроек для файлов с типом ".log" 
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.html',
  command = 'set filetype=html'
})
