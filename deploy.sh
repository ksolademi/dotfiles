#!/bin/bash

function cphome() {
    backupinhome $1
    cp -r $1 ~/
}

function backupinhome() {
    cp -r ~/$1 ~/$1.old
}

cphome .bash_aliases
cphome .bashrc
cphome .vim
cphome .vimrc

cp ~/.ipython/ipy_user_conf.py ~/.ipython/ipy_user_conf.py.old
cp ipy_user_conf.py ~/.ipython/ipy_user_conf.py
