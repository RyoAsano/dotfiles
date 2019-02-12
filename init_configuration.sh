mkdir .vim/
mkdir .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mvim -c PluginInstall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
