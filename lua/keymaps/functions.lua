-- Quick compilation with GCC and running
vim.keymap.set('n', 'co', '<cmd>:!gcc -o test % && ./test', {noremap = true})
