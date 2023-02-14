-- Выход из режима "ВСТАВКА" (insert)
vim.keymap.set('i', '<C-i>', '<escape>', {noremap = true, silent = true})

-- Быстрый сдвиг текста в режиме 'ВСТАВКА' (insert)
-- (надо будет проработать в визуальном режиме на множество строк)
vim.keymap.set({'i', 'v', 't'}, '<tab>', '<cmd>><cr>', {noremap = true, silent = true})
vim.keymap.set({'i', 'v', 't'}, '<s-tab>', '<cmd><<cr>', {noremap = true, silent = true})

-- Отключение стрелок
vim.keymap.set({'n', 'i', 'v', 't'}, '<left>', '', {noremap = true, silent = true})
vim.keymap.set({'n', 'i', 'v', 't'}, '<up>', '', {noremap = true, silent = true})
vim.keymap.set({'n', 'i', 'v', 't'}, '<right>', '', {noremap = true, silent = true})
vim.keymap.set({'n', 'i', 'v', 't'}, '<down>', '', {noremap = true, silent = true})
vim.keymap.set({'n', 'i', 'v', 't'}, '<s-left>', '', {noremap = true, silent = true})
vim.keymap.set({'n', 'i', 'v', 't'}, '<s-up>', '', {noremap = true, silent = true})
vim.keymap.set({'n', 'i', 'v', 't'}, '<s-right>', '', {noremap = true, silent = true})
vim.keymap.set({'n', 'i', 'v', 't'}, '<s-down>', '', {noremap = true, silent = true})
vim.keymap.set({'n', 'i', 'v', 't'}, '<c-left>', '', {noremap = true, silent = true})
vim.keymap.set({'n', 'i', 'v', 't'}, '<c-up>', '', {noremap = true, silent = true})
vim.keymap.set({'n', 'i', 'v', 't'}, '<c-right>', '', {noremap = true, silent = true})
vim.keymap.set({'n', 'i', 'v', 't'}, '<c-down>', '', {noremap = true, silent = true})

-- Быстрое форматирование всего документа
vim.keymap.set({'n', 'v', 't'}, 'F', '1GVG=<cr>', {noremap = true, silent = true})
