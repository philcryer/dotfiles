dotty
=====

These are my working dotfiles and configurations for profile, ssh, bash, zsh, git, vim and now [i3](http://i3wm.org/) (a Linux window manager). You don't need to use all of these to use these configs, if . A handy install file will popuplate your home dir, also [Oh my zsh](http://ohmyz.sh/) is recommended, if found you'll get my theme for that too.

## vi errors? Could be a bug, might need to do this

```
sudo apt-get install vim-nox
mkdir ~/.vim/backups
```

## don't have zsh? Want it?

### install zsh

```
sudo apt-get install zsh
```

### then install oh-my-zsh cmd

```
curl -L http://install.ohmyz.sh | sh
```

### lastly change your default shell

```
chsh -s /usr/bin/zsh
exit
```

### close/reopen your term and you should be all set
