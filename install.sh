#!/bin/bash

echo "This will overwrite your dotfiles for profile, bash, git, vim, zsh in `echo ~`"

read -p "Are you sure you want to do this? [Y/n] " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo -n "=> Creating directories..." 
  if [ ! -d "${HOME}/.vim/backups" ]; then
    mkdir -p ${HOME}/.vim/backups
  fi
	echo "done"

	echo -n "=> Copying files..." 
	cp -Rf src/.bashrc src/.gitconfig src/.gitignore src/.gitrc src/.oh-my-zsh src/.profile src/.ssh src/.vim src/.vimrc src/.zshrc ${HOME}
	echo "done"

  echo -n "=> (If found) adding oh-my-zsh theme and plugins..." 
  if [ ! -d "${HOME}/.oh-my-zsh" ]; then
	  cp src/.oh-my-zsh/themes/fak3r.zsh-theme ${HOME}/.oh-my-zsh/themes/
    cp -R src/.oh-my-zsh/plugins/* ${HOME}/.oh-my-zsh/plugins/
  fi
	echo "done"

	echo "NOTICE:"
	echo "=> ZSHRC check/change timezone, currently set as `cat ~/.zshrc|grep TZ`"
	echo "=> GITCONFIG change name and eamil"
fi

exit 0
