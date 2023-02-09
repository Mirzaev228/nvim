-- Инициализация
vim.cmd('packadd packer.nvim')

return require('packer').startup(function(use)
  -- Менеджер плагинов Packer (автообновление)
  use 'wbthomason/packer.nvim'

  -- Быстрая настройка LSP-серверов
	use 'neovim/nvim-lspconfig'

	-- Прогресс LSP
	use {
		'j-hui/fidget.nvim',
		config = function() require('fidget') end
	}

	-- Интерфейс отображающий найденные проблемы LSP-серверами
	use {
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require('trouble') end
	}

	-- Пиктограммы которые используются плагинами
	use {
		'onsails/lspkind-nvim',
		config = function() require('plugins/lspkind') end
	}

  -- Интеграция с GIT
	use {
		'lewis6991/gitsigns.nvim',
		config = function() require('gitsigns') end
	}

	-- Отрисовка в реальном времени найденных ошибок LSP-серверами
  use {
	  'onsails/diaglist.nvim',
		config = function() require('diaglist') end
	}

	-- Интерфейс строки состояния
  use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function() require('plugins/lualine') end
	}

  -- Дополнение для "nvim-lualine/lualine.nvim" с отображением прогресса работы с LSP-серверами 
  use {
    'arkav/lualine-lsp-progress',
    config = function() require('plugins/lualine-lsp-progress') end
  }

	-- Интерфейс строки буфера файлов
	use {
		'noib3/nvim-cokeline',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins/cokeline') end
	}

	-- Интерфейс древовидной структуры файлов
  use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		requires  = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons',
			'MunifTanjim/nui.nvim'
		},
		config = function() require('plugins/neo-tree') end
	}

	-- Автодополнение скобок и кавычек
	use {
		'windwp/nvim-autopairs',
		config = function()	require('plugins/autopairs') end
	}

  -- Загрузчик расширений
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function() require('plugins/coc') end
  }

  -- Цвета для отображения найденных ошибок LSP-сервером в случае если другие цвета не найдены
  use 'folke/lsp-colors.nvim'

  -- Менеджер пакетов для LSP-серверов, DAP-серверов, линтеров и форматировщиков
  use { 
    'williamboman/mason.nvim',
    config = function() require('plugins/mason') end
  }

  -- Быстрое обновление всех пакетов через "nwilliamboman/mason.nvim"
  use 'RubixDev/mason-update-all'

  -- Мост между "williamboman/mason.nvim" и "neovim/nvim-lspconfig"
  use {
    'williamboman/mason-lspconfig.nvim',
    requires = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig'
    }
  }

  -- Клиентская реализация DAP
  use {
    'mfussenegger/nvim-dap',
    config = function() require('plugins/dap') end
  }

  -- Мост между "nwilliamboman/mason.nvim" и "mfussenegger/nvim-dap"
  use {
    'jay-babu/mason-nvim-dap.nvim',
    requires = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap'
    }
  }

  -- Линтер, форматировщик и прочее
  use {
    'jose-elias-alvarez/null-ls.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function() require('plugins/null-ls') end
  }
end)
