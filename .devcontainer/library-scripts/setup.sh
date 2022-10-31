#!/usr/bin/env bash


BASEDIR=$(dirname "$0")
PROJRCT_DIR=$(pwd)
echo "BASEDIR" $BASEDIR
echo "PROJRCT_DIR" $PROJRCT_DIR

# create .ssh dir and copy host ssh key into container ssh dir
mkdir ~/.ssh
cp -RT ~/.ssh_host ~/.ssh
chown $(id -u -n) ~/.ssh
chmod -R 700 ~/.ssh

# setup ssh agent
# $BASEDIR/setup-ssh-agent.sh

# add project dir to git safe directory
git config --global --add safe.directory $PROJRCT_DIR

# run jupyter notebook
start-notebook.sh --NotebookApp.password='sha1:a0268751f102:c4b524e0443d0634f758af80fb2f7ce131ba220c'