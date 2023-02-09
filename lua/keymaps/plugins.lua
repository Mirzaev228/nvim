--[[ nvim-neo-tree/neo-tree ]]

-- Открыть интерфейс
vim.keymap.set('n', '<space>ff', '<cmd>NeoTreeShow<cr>', {noremap = true})
vim.keymap.set('n', '<space>fd', '<cmd>NeoTreeReveal<cr>', {noremap = true})

--[[ onsails/diaglist.nvim ]]

-- Открыть интерфейс диагностики
vim.keymap.set('n', '<space>dw', '<cmd>lua require(\'diaglist\').open_all_diagnostics()<cr>', {noremap = true})
vim.keymap.set('n', '<space>d0', '<cmd>lua require(\'diaglist\').open_buffer_diagnostics()<cr>', {noremap = true})

--[[ noib3/nvim-cokeline ]]

-- Переключение вкладок
vim.keymap.set('n', '<tab>', '<Plug>(cokeline-focus-next)', {noremap = true, silent = true})
vim.keymap.set('n', '<s-tab>', '<Plug>(cokeline-focus-prev)', {noremap = true, silent = true})

--[[ neoclide/coc ]]

-- Автозавершение
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
vim.keymap.set('i', '<tab>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', {silent = true, noremap = true, expr = true, replace_keycodes = false})
vim.keymap.set('i', '<s-tab>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], {silent = true, noremap = true, expr = true, replace_keycodes = false})

-- Применить выбранное автозавершение
vim.keymap.set('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], {silent = true, noremap = true, expr = true, replace_keycodes = false})

-- Отобразить меню фрагментов
vim.keymap.set('i', '<c-j>', '<Plug>(coc-snippets-expand-jump)', {silent = true, noremap = true, expr = true, replace_keycodes = false})

-- Отобразить меню автозавершений
vim.keymap.set('i', '<c-space>', 'coc#refresh()', {silent = true, expr = true})

-- Навигация в диагностической панели
vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})

-- GoTo-навигация
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', {silent = true})
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', {silent = true})

-- Отобразить документацию в окне представления
function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end
vim.keymap.set('n', 'k', '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Подсветка символа и ссылаемые на него объекты при событии "CursorHold" (курсор неподвижен)
vim.api.nvim_create_augroup('CocGroup', {})
vim.api.nvim_create_autocmd('CursorHold', {
  group = 'CocGroup',
  command = 'silent call CocActionAsync(\'highlight\')',
  desc = 'Подсветка символа и ссылаемые на него объекты при событии "CursorHold"'
})

-- Переименовать символ
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', {silent = true})

-- Форматировать выбранный код
vim.keymap.set('x', '<leader>f', '<Plug>(coc-format-selected)', {silent = true})
vim.keymap.set('n', '<leader>f', '<Plug>(coc-format-selected)', {silent = true})

-- Установить formatexpr для указанных типов файлов
vim.api.nvim_create_autocmd('FileType', {
  group = 'CocGroup',
  pattern = 'typescript,json',
  command = 'setl formatexpr=CocAction(\'formatSelected\')',
  desc = 'Установить formatexpr для указанных типов файлов'
})

-- Обновить вспомогательную запись на всплывающем заполнителе
vim.api.nvim_create_autocmd('User', {
  group = 'CocGroup',
  pattern = 'CocJumpPlaceholder',
  command = 'call CocActionAsync(\'showSignatureHelp\')',
  desc = 'Обновить вспомогательную запись на всплывающем заполнителе'
})

-- Применить codeAction к выбранному региону
vim.keymap.set('x', '<leader>a', '<Plug>(coc-codeaction-selected)', {silent = true, nowait = true})
vim.keymap.set('n', '<leader>a', '<Plug>(coc-codeaction-selected)', {silent = true, nowait = true})

-- Применить действия с кодом в позиции курсора
vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction-cursor)', {silent = true, nowait = true})

-- Применить действия с кодом на всём буфере
vim.keymap.set('n', '<leader>as', '<Plug>(coc-codeaction-source)', {silent = true, nowait = true})

-- Применить codeActions в текущем буфере
vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction)', {silent = true, nowait = true})

-- Применить наиболее предпочтительное быстрое исправление в текущей строке
vim.keymap.set('n', '<leader>qf', '<Plug>(coc-fix-current)', {silent = true, nowait = true})

-- Применить рефакторинг
vim.keymap.set('n', '<leader>re', '<Plug>(coc-codeaction-refactor)', {silent = true})
vim.keymap.set('x', '<leader>r', 'Plug>(coc-codeaction-refactor-selected)', {silent = true})
vim.keymap.set('n', '<leader>r', 'Plug>(coc-codeaction-refactor-selected)', {silent = true})

-- Выполнить действия Code Lens в текущей строке 
vim.keymap.set('n', '<leader>cl', '<Plug>(coc-codelens-action)', {silent = true, nowait = true})

-- Назначение функция и классов текстовых объектов
vim.keymap.set('x', 'if', '<Plug>(coc-funcobj-i)', {silent = true, nowait = true})
vim.keymap.set('o', 'if', '<Plug>(coc-funcobj-i)', {silent = true, nowait = true})
vim.keymap.set('x', 'af', '<Plug>(coc-funcobj-a)', {silent = true, nowait = true})
vim.keymap.set('o', 'af', '<Plug>(coc-funcobj-a)', {silent = true, nowait = true})
vim.keymap.set('x', 'ic', '<Plug>(coc-classobj-i)', {silent = true, nowait = true})
vim.keymap.set('o', 'ic', '<Plug>(coc-classobj-i)', {silent = true, nowait = true})
vim.keymap.set('x', 'ac', '<Plug>(coc-classobj-a)', {silent = true, nowait = true})
vim.keymap.set('o', 'ac', '<Plug>(coc-classobj-a)', {silent = true, nowait = true})

-- Прокрутка во всплывающих окнах
vim.keymap.set('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : \'<C-f>\'', {silent = true, nowait = true, expr = true})
vim.keymap.set('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : \'<C-b>\'', {silent = true, nowait = true, expr = true})
vim.keymap.set('i', '<C-f>', 'coc#float#has_scroll() ? \'<c-r>=coc#float#scroll(1)<cr>\' : \'<Right>\'', {silent = true, nowait = true, expr = true})
vim.keymap.set('i', '<C-b>', 'coc#float#has_scroll() ? \'<c-r>=coc#float#scroll(0)<cr>\' : \'<Left>\'', {silent = true, nowait = true, expr = true})
vim.keymap.set('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : \'<C-f>\'', {silent = true, nowait = true, expr = true})
vim.keymap.set('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : \'<C-b>\'', {silent = true, nowait = true, expr = true})

-- Выбрать диапазон
vim.keymap.set('n', '<C-s>', '<Plug>(coc-range-select)', {silent = true})
vim.keymap.set('x', '<C-s>', '<Plug>(coc-range-select)', {silent = true})

-- Команда ":Format" для форматирования текущего буфера
vim.api.nvim_create_user_command('Format', 'call CocAction(\'format\')', {})

-- Команда ":Fold" для сворачивания текущего буфера
vim.api.nvim_create_user_command('Fold', 'call CocAction(\'fold\', <f-args>)', {nargs = '?'})

-- Команда ":OR" для организации импорта текущего буфера
vim.api.nvim_create_user_command('OR', 'call CocActionAsync(\'runCommand\', \'editor.action.organizeImport\')', {})

-- Показать всю диагностику
vim.keymap.set('n', '<space>a', ':<C-u>CocList diagnostics<cr>', {silent = true, nowait = true})

-- Управление расширениями
vim.keymap.set('n', '<space>e', ':<C-u>CocList extensions<cr>', {silent = true, nowait = true})

-- Показать команды
vim.keymap.set('n', '<space>c', ':<C-u>CocList commands<cr>', {silent = true, nowait = true})

-- Поиск символа текущего документа
vim.keymap.set('n', '<space>o', ':<C-u>CocList outline<cr>', {silent = true, nowait = true})

-- Поиск символа рабочей области
vim.keymap.set('n', '<space>s', ':<C-u>CocList -I symbols<cr>', {silent = true, nowait = true})

-- Выполнить действие по умолчанию для следующего элемента
vim.keymap.set('n', '<space>j', ':<C-u>CocNext<cr>', {silent = true, nowait = true})

-- Выполнить действие по умолчанию для предыдущего элемента
vim.keymap.set('n', '<space>k', ':<C-u>CocPrev<cr>', {silent = true, nowait = true})

-- Восстановить последний список
vim.keymap.set('n', '<space>p', ':<C-u>CocListResume<cr>', {silent = true, nowait = true})
