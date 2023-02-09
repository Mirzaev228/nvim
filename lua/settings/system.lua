-- Использовать системный буфер обмена
vim.opt.clipboard = 'unnamedplus'

-- Автодополнение (встроенное в Neovim)
vim.opt.completeopt = 'menuone,noselect'

-- Не автокомментировать новые линии при переходе на новую строку
vim.cmd('autocmd BufEnter * set fo-=c fo-=r fo-=o')

-- Нумерация строк
vim.opt.number = true

-- Отключение бекапов (для плагина coc)
vim.opt.backup = false
vim.opt.writebackup = false

-- Интервал обновлений отрисовки
vim.opt.updatetime = 300

-- Всегда отображать signcolumn (?)
vim.opt.signcolumn = "yes"



