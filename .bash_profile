################################################################################
# Git info, if there is git in CWD
################################################################################
# define git branch logic
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (*\([^)]*\))*/\1/'
}
# define git branch ui for prompt below to use
markup_git_branch() {
  if [[ -n $@ ]]; then
    if [[ -z $(git status --porcelain 2> /dev/null) ]]; then
      echo -e " \001\033[32m\002($@)\001\033[0m\002"
    else
      echo -e " \001\033[31m\002($@)\001\033[0m\002"
    fi
  fi
}

################################################################################
# Set PS1 (console prompt) for great justice!
################################################################################
# My standard console prompt uses the above git logic, and looks like this:
#
#   hostname directory (git-branch)
#   └─ $ 
#
# Sometimes the hostname is annoying, so I override it with something I throw
# in ~/.local/prompt (ie- my username)
if [ -f "$HOME/.local/prompt" ]; then
  export PS1="\[\033[0;35m\]\[\033[0m\033[0;35m\]`cat $HOME/.local/prompt` \[\033[0;36m\]\W\$(markup_git_branch \$(parse_git_branch))\n\[\033[0;37m\]└─\[\033[0m\033[0;37m\] \$\[\033[0m\033[0;32m\] \[\033[0m\]"
else
  #export PS1="\[\033[0;35m\]\[\033[0m\033[0;35m\]\h \033[0;36m\]\W\$(markup_git_branch \$(parse_git_branch))\n\[\033[0;37m\]└─\[\033[0m\033[0;37m\] \$\[\033[0m\033[0;32m\] \[\033[0m\]"
  export PS1="\[\033[0;35m\]\[\033[0m\033[0;35m\]\h \[\033[0;36m\]\W\$(markup_git_branch \$(parse_git_branch))\n\[\033[0;37m\]└─\[\033[0m\033[0;37m\] \$\[\033[0m\033[0;32m\] \[\033[0m\]"
fi

################################################################################
# Load the aliases file, if it exists, and any -local overrides
################################################################################
if [ -f "$HOME/.aliases" ] ; then
  source $HOME/.aliases
fi

################################################################################
# Load any work overrides, like aliases, paths or anything else needed
################################################################################
if [ -f "$HOME/.local/work" ] ; then
  source $HOME/.local/work
fi

################################################################################
# Set various variables
################################################################################
export EDITOR="nvim"

################################################################################
# Add $home/bin to our PATH, if it exists
################################################################################
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

################################################################################
# Bash Function To Extract File Archives Of Various Types, from:
# https://ostechnix.com/a-bash-function-to-extract-file-archives-of-various-types/
################################################################################
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1     ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1     ;;
             *.rar)       rar x $1       ;;
             *.gz)        gunzip $1      ;;
             *.tar)       tar xf $1      ;;
             *.tbz2)      tar xjf $1     ;;
             *.tgz)       tar xzf $1     ;;
             *.zip)       unzip $1       ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

################################################################################
# Show all color options, just to be fancy
################################################################################
# I used to have this to list all color options to remind me in cause I want to
# change things, but I've left it in because it looks good 
for (( i = 30; i < 38; i++ )); do echo -e "\033[0;"$i"m Normal: (0;$i); \033[1;"$i"m Light: (1;$i)"; done

################################################################################
# Flash some details from the new host
################################################################################
#   FIXME create nicer custom /etc/motd override, maybe something like:
echo -e "\001\033[32m\002~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\001\033[0m\002"
echo -e "`uname -rsmn`; (`uname -a | cut -d" " -f8,9,10,11,12,13`)"
echo "`w`"
echo -e "\001\033[32m\002~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\001\033[0m\002"
