#!/bin/bash

#TODO: check if user and home are defined

INSTALL_DIR=$(dirname $0)

ln -s ${INSTALL_DIR}/.vimrc ${HOME}/.vimrc
ln -s ${INSTALL_DIR}/.gvimrc ${HOME}/.gvimrc
