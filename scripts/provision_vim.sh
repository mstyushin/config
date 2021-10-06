#!/bin/bash

WORKDIR=$( cd $( dirname ${BASH_SOURCE[0]})/../ && pwd )
VIMHOME="${HOME}/.vim"

# plugin versions go here
VIMGO_V="v1.25"
PYTHONMODE_V="0.13.0"

mkdir -p ${VIMHOME}/pack/plugins/start ${VIMHOME}/pack/plugins/opt ${VIMHOME}/colors

# install color theme
cp ${WORKDIR}/vim/colors/* ${VIMHOME}/colors/

# install vim-go plugin
if [[ ! -d "${VIMHOME}/pack/plugins/start/vim-go" ]]; then
    git clone git@github.com:fatih/vim-go.git ${VIMHOME}/pack/plugins/start/vim-go
    cd ${VIMHOME}/pack/plugins/start/vim-go && git checkout ${VIMGO_V}
    vim -c 'GoInstallBinaries' +qall
fi

# install python-mode plugin
if [[ ! -d "${VIMHOME}/pack/plugins/start/python-mode" ]]; then
    git clone --recurse-submodules git@github.com:python-mode/python-mode.git ${VIMHOME}/pack/plugins/start/python-mode
    cd ${VIMHOME}/pack/plugins/start/python-mode && git checkout ${PYTHONMODE_V}
fi

# rebuild helptags for everything just in case
vim -c 'helptags ALL' +qall

echo "vim has been provisioned"

