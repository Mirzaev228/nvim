#!/usr/bin/fish

# Деинициализация старого репозитория
rm -rf ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Инициализация репозитория
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
