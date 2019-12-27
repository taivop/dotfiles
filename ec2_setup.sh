sudo yum update

mkdir repos


git clone git@github.com:taivop/dotfiles.git ~/.dotfiles
sh ~/.dotfiles/install.sh

# Install grc
git clone https://github.com/garabik/grc ~/repos/grc
cd ~/repos/grc
sudo sh install.sh
cd

# Setup vim
git clone https://github.com/altercation/vim-colors-solarized ~/repos/vim-colors-solarized
mkdir -p ~/.vim/colors
cp ~/repos/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


