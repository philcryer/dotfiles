dotty
=====

These are my working dotfiles and configurations for profile, ssh, bash, zsh, git, vim and now [i3](http://i3wm.org/) (a minimal and fast Linux window manager). You don't need to use all of these to use these configs, if . A handy install file will popuplate your home dir, also [sbusso/zprezto](https://github.com/sbusso/zprezto) will be installed and setup with a basic config.

## usage

run the handy `install.sh` script to automatically setup all of the dot files w/o prompts. Note, you should _read the code_ (amiright Mike?) before blindy running this.

```
./install.sh
```

When it's done, close/reopen your session and you should be all set

## issues?

### vi errors? Could be a bug, or you might need to do this

```
sudo apt-get install vim-nox
mkdir ~/.vim/backups
```

YMMV if you're not runningn Debian or Ubuntu.

### don't have zsh installed?

```
sudo apt-get install zsh
```

YMMV if you're not runningn Debian or Ubuntu.
