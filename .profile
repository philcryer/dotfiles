# set paths, include ones for gemfiles and homebrew (if osx)
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/lib/gems/1.8/bin/
if [ -d '${HOME}/bin/' ]; then
	export PATH="${HOME}/bin:${PATH}"
fi

# alias
alias ports='lsof -nPi | grep LIST | awk '\''{printf "%-20s%-5s%-5s%s\n",$1,$5,$7,$8}'\'' | sort | uniq'


# default ls colors in OSX aren't good for dark themes - this fixes that (bsd ls)
if [ `uname` = 'Darwin' ];then
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced
    alias ls="ls -G"
fi

# variables
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR=vim.nox
# Enable CLI colors
export CLICOLOR=1
# Make OSX dirs appear in a lighter blue for the ls
export LSCOLORS=ExGxCxDxCxegedabagacec
# Props to dd for the haX! You are sooooo siq dude!

TZ='Chicago/America'; export TZ

mesg n
