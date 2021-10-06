#!/bin/bash

WORKDIR=$( cd $( dirname ${BASH_SOURCE[0]})/../ && pwd )
VIMHOME="${HOME}/.vim"

mkdir -p ${VIMHOME}/pack/plugins/start ${VIMHOME}/pack/plugins/opt ${VIMHOME}/colors

# install color theme
cp ${WORKDIR}/vim/colors/* ${VIMHOME}/colors/

# install vim-go plugin
if [[ ! -d "${VIMHOME}/pack/plugins/start/vim-go" ]]; then
  git clone git@github.com:fatih/vim-go.git ${VIMHOME}/pack/plugins/start/vim-go
  cd ${VIMHOME}/pack/plugins/start/vim-go && git checkout v1.25
  vim -c 'GoInstallBinaries' +qall
fi


echo "vim has been provisioned"

