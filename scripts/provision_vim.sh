#!/bin/bash

mkdir -p ${HOME}/.vim/pack/plugins/start ${HOME}/.vim/pack/plugins/opt

# install vim-go plugin
git clone git@github.com:fatih/vim-go.git ${HOME}/.vim/pack/plugins/start/vim-go

vim -c 'GoInstallBinaries" +qall

echo "vim has been provisioned"
