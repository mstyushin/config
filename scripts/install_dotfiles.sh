#!/bin/bash

DOTFILES_DIR="./dotfiles"

while [[ "$1" != "" ]]; do
  case $1 in
    -f | --force )
      FORCE=true
      ;;
    * )
      echo "unknown flag" 
      exit 1
    esac
  shift
done


for file in ${DOTFILES_DIR}/*; do
  fname=$(basename ${file})
  if [[ ! ${FORCE} ]]; then
    cp -p ${HOME}/.${fname} ${HOME}/.${fname}_bak
  fi
  echo "installing ${HOME}/.${fname}"
  cp -pf ${DOTFILES_DIR}/${fname} ${HOME}/.${fname} 
done

echo "done"

exit 0
