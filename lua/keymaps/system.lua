-- Выход из режима "ВСТАВКА" (insert)
vim.api.nvim_set_keymap('i', '<C-i>', '<escape>', {noremap = true})

-- Быстрый сдвиг текста в режиме 'ВСТАВКА' (insert)
vim.api.nvim_set_keymap('i', '<tab>', '<cmd>><cr>', {noremap = true})
vim.api.nvim_set_keymap('i', '<s-tab>', '<cmd><<cr>', {noremap = true})
