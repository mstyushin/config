#!/bin/bash

echo "[INFO] Starting vim provisioner"

WORKDIR=$( cd $( dirname ${BASH_SOURCE[0]})/../ && pwd )
VIMHOME="${HOME}/.vim"

# plugin versions go here
VIMGO_V="v1.28"
PYTHONMODE_V="0.13.0"
NERDTREE_V="6.10.16"

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

# install nerdtree plugin
if [[ ! -d "${VIMHOME}/pack/plugins/start/nerdtree" ]]; then
    git clone git@github.com:preservim/nerdtree.git ${VIMHOME}/pack/plugins/start/nerdtree
    cd ${VIMHOME}/pack/plugins/start/nerdtree && git checkout ${NERDTREE_V}
fi

# install nerdtree-git plugin
if [[ ! -d "${VIMHOME}/pack/plugins/start/nerdtree-git-plugin" ]]; then
    git clone git@github.com:Xuyuanp/nerdtree-git-plugin.git ${VIMHOME}/pack/plugins/start/nerdtree-git-plugin 
fi

# install vim-terraform
if [[ ! -d "${VIMHOME}/pack/plugins/start/vim-terraform" ]]; then
     git clone git@github.com:hashivim/vim-terraform.git ${VIMHOME}/pack/plugins/start/vim-terraform
fi

# install vim-airline
if [[ ! -d "${VIMHOME}/pack/plugins/start/vim-airline" ]]; then
     git clone git@github.com:vim-airline/vim-airline.git ${VIMHOME}/pack/plugins/start/vim-airline
fi

# install vim-fugitive
if [[ ! -d "${VIMHOME}/pack/plugins/start/vim-fugitive" ]]; then
     git clone git@github.com:tpope/vim-fugitive.git ${VIMHOME}/pack/plugins/start/vim-fugitive
fi

# install fzf
if [[ ! -d "${VIMHOME}/pack/plugins/start/fzf" ]]; then
     git clone git@github.com:junegunn/fzf.git ${VIMHOME}/pack/plugins/start/fzf
fi

# install fzf.vim
if [[ ! -d "${VIMHOME}/pack/plugins/start/fzf.vim" ]]; then
     git clone git@github.com:junegunn/fzf.vim.git ${VIMHOME}/pack/plugins/start/fzf.vim
fi

# install vimwiki
if [[ ! -d "${VIMHOME}/pack/plugins/start/vimwiki" ]]; then
     git clone git@github.com:vimwiki/vimwiki.git ${VIMHOME}/pack/plugins/start/vimwiki
fi


# TODO: detect OS and install fzf/rg automatically
if ! hash fzf 2>/dev/null; then
    echo "[WARNING] You don't seem to have fzf installed"
    echo "[WARNING] Please install fzf using your OS package manager:"
    echo "[WARNING] Mac OS X --------> brew install fzf"
    echo "[WARNING] Debian   --------> sudo apt install fzf"
    echo "[WARNING] Arch     --------> sudo pacman -S fzf"
fi

if ! hash rg 2>/dev/null; then
    echo "[WARNING] You don't seem to have ripgrep installed"
    echo "[WARNING] Please install ripgrep using your OS package manager:"
    echo "[WARNING] Mac OS X --------> brew install ripgrep"
    echo "[WARNING] Debian   --------> sudo apt install ripgrep"
    echo "[WARNING] Arch     --------> sudo pacman -S ripgrep"
fi

if ! hash bat 2>/dev/null; then
    echo "[WARNING] You don't seem to have bat installed"
    echo "[WARNING] Please install bat using your OS package manager:"
    echo "[WARNING] Mac OS X --------> brew install bat"
    echo "[WARNING] Debian   --------> sudo apt install bat"
    echo "[WARNING] Arch     --------> sudo pacman -S bat"
fi

# rebuild helptags for everything just in case
echo "[INFO] Rebuilding helptags..."
vim -c 'helptags ALL' +qall

echo "[INFO] Vim has been provisioned"

