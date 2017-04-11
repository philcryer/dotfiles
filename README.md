dotty
=====

These are my working dotfiles and configurations for *nix consoles. I built this repo to standarize my configs across any host I work on, plus I like to be transparent


so they're all here. A handy install file will popuplate your home dir, also [sbusso/zprezto](https://github.com/sbusso/zprezto) will be installed and setup with a basic config.


ssh, bash, zsh, git, vim and now [i3](http://i3wm.org/) (a minimal and fast Linux window manager). 

The installation of my `dotty` files is now automated through [philcryer/basejump](https://github.com/philcryer/basejump), see the [README.md](https://github.com/philcryer/basejump/README.md) for directions and usage.


I'm working in some nice `.osx` defaults thanks to the repo [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)

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

YMMV if you're not running Debian or Ubuntu.
