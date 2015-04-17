#!/bin/bash

echo "This will overwrite your dotfiles for profile, bash, git, vim, zsh in `echo ~`"
read -p "Are you sure you want to do this? [Y/n] " -n 1 -r; echo

if [[ $REPLY =~ ^[Yy]$ ]]
	echo "=> Checking for required software..."
    for cli in zsh git; do
   	if ! type "$cli" > /dev/null 2>&1; then
      "NOTICE $cli is not installed - trying to install"
	     sudo apt-get install $cli
    fi
  done
  echo "=> Checing for required packages..."
  if [ ! -d '/usr/share/doc/vim-nox' ]; then
    sudo apt-get install vim-nox
  fi
then
	echo -n "=> Creating directories..." 
  	if [ ! -d "${HOME}/.vim/backups" ]; then
    		mkdir -p ${HOME}/.vim/backups
  	fi
	echo "done"

	echo -n "=> Copying files..." 
	cp -Rf src/.bashrc src/.gitconfig src/.gitignore src/.gitrc src/.oh-my-zsh src/.profile src/.ssh src/.vim src/.vimrc ${HOME}
	echo "done"

  	echo -n "=> Installing zpresto for zsh..."
    chmod 755 src/install_prezto.sh
  	cd src; ./install_prezto.sh
	echo "done"

  	echo "=> Attempting to change shell..."
  	chsh -s /bin/zsh
	echo "done"

	echo "NOTICE:"
	echo "=> ZSHRC check/change timezone, currently set as `cat ~/.zshrc|grep TZ`"
	echo "=> GITCONFIG change name and eamil"
fi

exit 0
