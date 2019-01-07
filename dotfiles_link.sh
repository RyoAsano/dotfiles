#!/bin/sh
ln -sf ~/dotfiles/.TeXmacs ~/.TeXmacs
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.emacs.d ~/.emacs.d
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.conda ~/.conda
ln -sf ~/dotfiles/.jupyter ~/.jupyter
ln -sf ~/dotfiles/.latexmkrc ~/.latexmkrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim ~/.vim

mkdir .vim/
mkdir .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mvim -c PluginInstall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
