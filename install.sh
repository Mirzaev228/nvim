#!/usr/bin/env fish

# need to rewrite in future
sudo apt install npm python3-venv ruby-dev -y
pip3 install --upgrade pynvim
sudo gem install neovim

# Install NeoVim module for NPM
sudo npm i -g neovim

# Инициализация текста сообщений в зависимости от установленного языка в оболочке
if test (string match -ri "ru" "$LANG")
  function print -a TYPE PARAM1 PARAM2 -d "Текст сообщений"
    switch $TYPE
      case PACKER_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить Packer? (\"wbthomason/packer.nvim\") (y/N) ";
			case PACKER_EXISTS
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Packer уже установлен. Переустановить? (y/N) ";
      case PACKER_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен Packer";
			case LSP_INTELEPHENSE_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить LSP-сервер для PHP? (\"bmewburn/vscode-intelephense\") (y/N) ";
			case LSP_INTELEPHENSE_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен LSP-сервер для PHP (\"bmewburn/vscode-intelephense\")";
			case LSP_VSCODE-LANGSERVERS_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить LSP-сервера от VSCode (JSON, HTML, CSS)? (\"hrsh7th/vscode-langservers-extracted\") (y/N) ";
			case LSP_VSCODE-LANGSERVERS_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлены LSP-сервера от VSCode (JSON, HTML, CSS) (\"hrsh7th/vscode-langservers-extracted\")";
			case LSP_EMMET_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить LSP-сервер для набора инструментов Emmet (HTML из CSS)? (\"aca/emmet-ls\") (y/N) ";
			case LSP_EMMET_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен LSP-сервер для набора инструментов Emmet (HTML из CSS) (\"aca/emmet-ls\")";
			case LSP_CSSMODULES_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить LSP-сервер для CSS (форматировщик)? (\"antonk52/cssmodules-language-server\") (y/N) ";
			case LSP_CSSMODULES_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен LSP-сервер для CSS (форматировщик) (\"antonk52/cssmodules-language-server\")";
			case LSP_DENO_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить LSP-сервер для JavaScript и PostScript? (\"denoland/deno\") (y/N) ";
			case LSP_DENO_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен LSP-сервер для JavaScript и PostScript (\"denoland/deno\")";
			case LSP_LUA_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить LSP-сервер для Lua? (\"luals/lua-language-server\") (y/N) ";
			case LSP_LUA_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен LSP-сервер для Lua (\"luals/lua-language-server\")";
			case FORMATTER_NGINX_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить форматировщик для NGINX? (\"vasilevich/nginxbeautifier\") (y/N) ";
			case FORMATTER_NGINX_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен форматировщик для NGINX (\"vasilevich/nginxbeautifier\")";
			case FORMATTER_PRETTIER_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить форматировщик Prettier? (\"prettier/vim-prettier\") (y/N) ";
			case FORMATTER_PRETTIER_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен форматировщик Prettier (\"prettier/vim-prettier\")";
			case FONT_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить шрифт "; set_color cyan; echo "FiraCode"; set_color white; echo " ? (y/N) ";
			case FONT_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен шрифт "; set_color cyan; echo "FiraCode"; set_color white; echo " (выбери его в настройках твоего эмулятора терминала)";
			case FONTS
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color magenta; echo -n "[ДАННЫЕ] "; set_color white; echo "Шрифты для GNOME эмулятора терминала: https://www.nerdfonts.com/font-downloads (моя рекомендация - "; set_color cyan; echo "FiraCode"; set_color white; echo ")";
			case FONT_PATCH
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Пропатчить шрифт для иконок ? (\"nvim-tree/nvim-web-devicons\") (y/N) ";
			case FONT_CHOOSE
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Выбери шрифт (путь) ";
			case FONT_PATCHED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Пропатчен шрифт для иконок  (\"nvim-tree/nvim-web-devicons\")";
    end
  end
else
  function print -a TYPE PARAM1 PARAM2 -d "Messages text"
    switch $TYPE
			case PACKER_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install Packer? (\"wbthomason/packer.nvim\") (y/N) ";
			case PACKER_EXISTS
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Packer already installed. Reinstall? (y/N) ";
      case PACKER_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed Packer";
			case LSP_INTELEPHENSE_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the LSP-server for PHP? (\"bmewburn/vscode-intelephense\") (y/N) ";
			case LSP_INTELEPHENSE_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the LSP-server for PHP (\"bmewburn/vscode-intelephense\")";
			case LSP_VSCODE-LANGSERVERS_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the LSP-servers from VSCode (JSON, HTML, CSS)? (\"hrsh7th/vscode-langservers-extracted\") (y/N) ";
			case LSP_VSCODE-LANGSERVERS_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the LSP-servers from VSCode (JSON, HTML, CSS) (\"hrsh7th/vscode-langservers-extracted\")";
			case LSP_EMMET_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the LSP-server for Emmet toolkit (HTML из CSS)? (\"aca/emmet-ls\") (y/N) ";
			case LSP_EMMET_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the LSP-server for Emmet toolkit (HTML из CSS) (\"aca/emmet-ls\")";
			case LSP_CSSMODULES_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the LSP-server for CSS (formatter)? (\"antonk52/cssmodules-language-server\") (y/N) ";
			case LSP_CSSMODULES_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Install the LSP-server for CSS (formatter) (\"antonk52/cssmodules-language-server\")";
			case LSP_DENO_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the LSP-server for JavaScript и PostScript? (\"denoland/deno\") (y/N) ";
			case LSP_DENO_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the LSP-server for JavaScript и PostScript (\"denoland/deno\")";
			case LSP_LUA_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the LSP-server for Lua? (\"luals/lua-language-server\") (y/N) ";
			case LSP_LUA_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the LSP-server for Lua (\"luals/lua-language-server\")";
			case FORMATTER_NGINX_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the formatter for NGINX? (\"vasilevich/nginxbeautifier\") (y/N) ";
			case FORMATTER_NGINX_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the formatter for NGINX (\"vasilevich/nginxbeautifier\")";
			case FORMATTER_PRETTIER_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the formatter Prettier? (\"prettier/vim-prettier\") (y/N) ";
			case FORMATTER_PRETTIER_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the formatter Prettier (\"prettier/vim-prettier\")";
			case FONT_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install "; set_color cyan; echo "FiraCode"; set_color white; echo " font ? (y/N) ";
			case FONT_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed "; set_color cyan; echo "FiraCode"; set_color white; echo " font (select it in your terminal emulator settings)";
			case FONTS
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color magenta; echo -n "[INFO] "; set_color white; echo "Fonts for GNOME terminal emulator: https://www.nerdfonts.com/font-downloads (my recommendation - "; set_color cyan; echo "FiraCode"; set_color white; echo ")";
			case FONT_PATCH
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Patch your font for icons ? (\"nvim-tree/nvim-web-devicons\") (y/N) ";
			case FONT_CHOOSE
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Choose a font (path)";
			case FONT_PATCHED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Pathed the font for icons  (\"nvim-tree/nvim-web-devicons\")";
	end
	end
end

# Installation request
set RESPONSE (read -n 1 -p "print PACKER_INSTALL")
bind -e y

if test (string match -ri 'y' "$RESPONSE")
	if test -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim
		# Найден репозиторий "wbthomason/packer.nvim"

		# Installation request
		set RESPONSE (read -n 1 -p "print PACKER_EXISTS")
		bind -e y

		if test (string match -ri 'y' "$RESPONSE")
			# Запрошена переустановка

			# Деинициализация старого репозитория
			rm -rf ~/.local/share/nvim/site/pack/packer/start/packer.nvim 1> /dev/null 2> /dev/null 

			# Инициализация репозитория
			git clone --depth 1 https://github.com/wbthomason/packer.nvim\
				~/.local/share/nvim/site/pack/packer/start/packer.nvim 1> /dev/null 2> /dev/null 

			print PACKER_INSTALLED
		end
	else 
		# Не найден репозиторий "wbthomason/packer.nvim" 

		# Инициализация репозитория
		git clone --depth 1 https://github.com/wbthomason/packer.nvim\
		 ~/.local/share/nvim/site/pack/packer/start/packer.nvim 1> /dev/null 2> /dev/null 

		print PACKER_INSTALLED
	end
end

# Installation request
set RESPONSE (read -n 1 -p "print LSP_INTELEPHENSE_INSTALL")
bind -e y

if test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "bmewburn/vscode-intelephense"

	# Установка
	npm i intelephense 1> /dev/null 2> /dev/null 

	print LSP_INTELEPHENSE_INSTALLED
end

# Installation request
set RESPONSE (read -n 1 -p "print LSP_VSCODE-LANGSERVERS_INSTALL")
bind -e y

if test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "hrsh7th/vscode-langservers-extracted"

	# Установка
	npm i vscode-langservers-extracted 1> /dev/null 2> /dev/null 

	print LSP_VSCODE-LANGSERVERS_INSTALLED
end

# Installation request
set RESPONSE (read -n 1 -p "print LSP_EMMET_INSTALL")
bind -e y

if test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "aca/emmet-ls"

	# Установка
	npm i emmet-ls 1> /dev/null 2> /dev/null 

	print LSP_EMMET_INSTALLED
end

# Installation request
set RESPONSE (read -n 1 -p "print LSP_CSSMODULES_INSTALL")
bind -e y

if test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "antonk52/cssmodules-language-server"

	# Установка
	npm i cssmodules-language-server 1> /dev/null 2> /dev/null 

	print LSP_CSSMODULES_INSTALLED
end

# Installation request
set RESPONSE (read -n 1 -p "print LSP_DENO_INSTALL")
bind -e y

if test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "denoland/deno"

	# Установка
	curl -fsSL https://deno.land/install.sh | sh 1> /dev/null 2> /dev/null 

	# TODO доделать нормально
	set -g DENO_INSTALL "$HOME/.deno"
	fish_add_path $DENO_INSTALL/bin

	print LSP_DENO_INSTALLED
end

# Installation request
set RESPONSE (read -n 1 -p "print LSP_LUA_INSTALL")GG
bind -e y

if test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "luals/lua-language-server"

	# Установка
	sudo apt install ninja-build -y
	cd ~/
	rm -rf lua-language-server 1> /dev/null 2> /dev/null
	git clone https://github.com/LuaLS/lua-language-server 1> /dev/null 2> /dev/null 
	cd lua-language-server
	fish ./make.sh 1> /dev/null 2> /dev/null 
 	fish_add_path $HOME/lua-language-server/bin 1> /dev/null 2> /dev/null 

	print LSP_LUA_INSTALLED
end

# Installation request
set RESPONSE (read -n 1 -p "print FORMATTER_NGINX_INSTALL")
bind -e y

if test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "vasilevich/nginxbeautifier"

	# Установка
	npm i nginxbeautifier 1> /dev/null 2> /dev/null 

	print FORMATTER_NGINX_INSTALLED
end

# Installation request
set RESPONSE (read -n 1 -p "print FORMATTER_PRETTIER_INSTALL")
bind -e y

if test (string match -ri 'y' "$RESPONSE")
	# Accepted installation of "prettier/vim-prettier"

	npm i prettier 1> /dev/null 2> /dev/null
G
	print FORMATTER_PRETTIER_INSTALLED
end

print FONTS

# Installation request
set RESPONSE (read -n 1 -p "print FONT_INSTALL")
bind -e y
if test (string match -ri 'y' "$RESPONSE")
	# Accepted installation of the FiraCode font
	
	mkdir -p ~/.local/share/fonts/FiraCode
	cd ~/.local/share/fonts/FiraCode
	wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip"
	unzip FiraCode.zip
	rm FiraCode.zip
	fc-cache -f -v

	print FONT_INSTALLED

	if (type -q dconf)
		# GNOME

		# if (string match (lsb_release -i | grep -Po '[^\s]*$') Ubuntu))
		# 	sudo apt-get install dconf
		# end
	end

	# dconf write /apps/gnome-terminal/profiles/Default/font FiraCodeNerdFontMono-Medium.ttf
	# gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type=boolean false
	# gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string FiraCodeNerdFontMono-Medium.ttf
else
	# Denied installation of the FiraCode font
	
	# Installation request
	set RESPONSE (read -n 1 -p "print FONT_PATCH")
	bind -e y

	if test (string match -ri 'y' "$RESPONSE")
		# Accepted to patching the font

		cd ~/
		wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip"
		unzip FontPatcher.zip -d font_patcher
		cd font_patcher

		#if not type -q python && type -q python3
		if not type -q python
			# alias python=python3
			sudo apt install python-is-python3 -y
		end

		sudo apt install fontforge python3-fontforge -y

		./font-patcher (read -p "print FONT_CHOOSE")

		print FONT_PATCHED
	end
end
