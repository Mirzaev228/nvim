#!/usr/bin/fish

# Инициализация текста сообщений в зависимости от установленного языка в оболочке
if test (string match -ri "ru" "$LANG")
  function print -a TYPE PARAM1 PARAM2 -d "Вывод сообщений по категориям"
    switch $TYPE
      case REPOSITORY_EXISTS
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Репозиторий \"wbthomason/packer.nvim\" уже существует. Переустановить? (y/N)";
      case REPOSITORY_CREATED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Репозиторий \"wbthomason/packer.nvim\" установлен";
    end
  end
else
  function print -a TYPE PARAM1 PARAM2 -d "Display messages by category"
    switch $TYPE
      case REPOSITORY_EXISTS
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "The \"wbthomason/packer.nvim\" repository already exists. Reinstall? (y/N)";
      case REPOSITORY_CREATED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Repository \"wbthomason/packer.nvim\" installed";
    end
  end
end

if test -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  # Найден репозиторий "wbthomason/packer.nvim"

  # Запрос выбора действия с репозиторием
  set RESPONSE (read -n 1 -p "print REPOSITORY_EXISTS")
  bind -e y

  if test (string match -ri 'y' "$RESPONSE")
    # Запрошена переустановка

    # Деинициализация старого репозитория
    rm -rf ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    # Инициализация репозиторий
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
      ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    print REPOSITORY_CREATED
  end
else 
  # Не найден репозиторий "wbthomason/packer.nvim" 

  # Инициализация репозитория
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim

  print REPOSITORY_CREATED
end
