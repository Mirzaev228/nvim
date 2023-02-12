-- Инициализация команды ":make" для проверки синтаксиса fish
vim.cmd.compiler('fish')

-- Длинные строки умещать в комментарии
vim.opt_local.textwidth = 79

-- Складывание блочных конструкций у fish
-- vim.opt_local.foldmethod = 'expr'
