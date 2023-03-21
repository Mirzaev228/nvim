-- Ширина символа <tab> (сдвига) в пробелах
vim.opt.tabstop = 2

-- Количество пробелов при операциях редактирования (например: вставка <tab>)
vim.opt.softtabstop = 2

-- Ширина отступа (если равняется tabstop, то используется только сдвиги)
vim.opt.shiftwidth = 2

-- Пробелы вместо сдвигов
vim.opt.expandtab = false

-- Копировать отступ из текущей строки при создании новой
vim.opt.autoindent = true

-- Умный отступ при создании новой строки
vim.opt.smartindent = true
