<div align="center" border="0"><img src="src/logo.png" alt="dotfiles"></div>

# dotfiles

These are my working dotfiles, configurations, and one liners for *nix consoles, mainly revelvant to Linux and macOS, with some specific things thrown in. I built this repo to standarize my configs across all hosts I work on, plus I like to be transparent, so they're all here. I use another project of mine, [philcryer/basejump](https://github.com/philcryer/basejump), which uses Ansible to automate the distribution of these files, as we all setting other standards on target hosts.  See the `basejump` [README.md](https://github.com/philcryer/basejump/blob/master/README.md) for directions and usage.

## features
 
Battle tested configs and setups for:

* .aliases - some helpful settings
* .bash_profile - a decent display prompt ouf the box, also includes ~/bin in you $PATH
* .curlrc - verbose output on
* .editorconfig 
* .exports
* .gitconfig - with many aliases for productivity
* .gitignore_global
* .gvimrc - if you use a GUI, I don't but keep this here for fun
* .hushlogin - simplify logins by not getting all the junk from the server
* .i3 - [i3wm.org](http://i3wm.org/) (a minimal and fast Linux window manager) 
* .inputrc
* .screenrc
* .screenrc.full - more options than I need
* .tmux.conf
* .vimrc - old config
* .wgetrc
* .zprofilec - a holdover from [sbusso/zprezto](https://github.com/sbusso/zprezto) a nice zsh setup
* .zshrc - a holdover from [sbusso/zprezto](https://github.com/sbusso/zprezto) a nice zsh setup
* .osx - a WIP, compling best practices from projects like [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)

## usage

Check out the project, change into the directory

```
git clone https://github.com/philcryer/dotfiles.git
cd dotfiles
```

Then copy whatever you want into your `${HOME}' directory to  try them out

## recommendations

Run Linux... obviously, and `vim-nox` to take advantage of the vim plugins:

```
sudo apt-get install vim-nox
```

### don't have zsh installed?

```
sudo apt-get install zsh
```

## issues or suggestions?

Just let me know in the Issues section

### thanks
