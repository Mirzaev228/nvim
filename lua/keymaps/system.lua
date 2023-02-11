-- Выход из режима "ВСТАВКА" (insert)
vim.keymap.set('i', '<C-i>', '<escape>', {noremap = true})

-- Быстрый сдвиг текста в режиме 'ВСТАВКА' (insert)
vim.keymap.set('i', '<tab>', '<cmd>><cr>', {noremap = true})
vim.keymap.set('i', '<s-tab>', '<cmd><<cr>', {noremap = true})

-- Отключение стрелок
vim.keymap.set('n', '<left>', '', {noremap = true})
vim.keymap.set('n', '<up>', '', {noremap = true})
vim.keymap.set('n', '<right>', '', {noremap = true})
vim.keymap.set('n', '<down>', '', {noremap = true})
