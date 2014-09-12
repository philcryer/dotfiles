#!/bin/bash

echo "This will overwrite your dotfiles for profile, bash, git, vim and zsh in `echo ~`"

read -p "Are you sure you want to do this? [Y/n] " -n 1 -r; echo   
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo -n "=> Copying files..." 
	cp -Rf .* ~
	echo "done"
	echo "NOTICE:"
	echo "=> ZSHRC check/change timezone, currently set as `cat ~/.zshrc|grep TZ`"
	echo "=> GITCONFIG change name and eamil"
fi

exit 0
