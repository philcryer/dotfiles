#!/bin/bash

echo "This will overwrite your dotfiles for profile, bash, git, vim and zsh in `echo ~`"

read -p "Are you sure you want to do this? [Y/n] " -n 1 -r; echo   
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo -n "=> Creating directories..." 
  if [ ! -d "${HOME}/.vim/backups" ]; then
    mkdir -p ${HOME}/.vim/backups
  fi
	echo "done"

	echo -n "=> Copying files..." 
	cp -Rf src/.* ${HOME}
	cp src/fak3r.zsh-theme ~/.oh-my-zsh/themes/
	echo "done"

  echo -n "=> Adding oh-my-zsh theme (if found)..." 
  if [ ! -d "${HOME}/.oh-my-zsh" ]; then
	  cp src/fak3r.zsh-theme ${HOME}/.oh-my-zsh/themes/
  fi
	echo "done"

	echo "NOTICE:"
	echo "=> ZSHRC check/change timezone, currently set as `cat ~/.zshrc|grep TZ`"
	echo "=> GITCONFIG change name and eamil"
fi

exit 0
