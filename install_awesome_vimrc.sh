#!/bin/sh
set -e

cd ~/.vim_runtime

# added this line to automatically install plugins in the sources_non_forked directory
python update_plugins.py

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

# newly added: update_plugins remove git info of the installed plugin
# but sometimes this is needed.
# e.g.
rm -rf ~/.vim_runtime/sources_non_forked/YouCompleteMe
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim_runtime/sources_non_forked/
cd ~/.vim_runtime/sources_non_forked/YouCompleteMe
git submodule update --init --recursive
python3 install.py

cd ~/.vim_runtime

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
