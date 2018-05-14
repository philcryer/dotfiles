# define git branch logic
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (*\([^)]*\))*/\1/'
}

# define git branch ui
markup_git_branch() {
  if [[ -n $@ ]]; then
    if [[ -z $(git status --porcelain 2> /dev/null) ]]; then
      echo -e " \001\033[32m\002($@)\001\033[0m\002"
    else
      echo -e " \001\033[31m\002($@)\001\033[0m\002"
    fi
  fi
}

# define console
export PS1="\[\033[0;35m\]\[\033[0m\033[0;35m\]\h \033[0;36m\]\W\$(markup_git_branch \$(parse_git_branch))\n\[\033[0;37m\]└─\[\033[0m\033[0;37m\] \$\[\033[0m\033[0;32m\] \[\033[0m\]"

# list all color options
for (( i = 30; i < 38; i++ )); do echo -e "\033[0;"$i"m Normal: (0;$i); \033[1;"$i"m Light: (1;$i)"; done

# set various varaiables
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi
export PATH=$PATH:~/bin

export http_proxy="http://10.0.0.250:80"; export https_proxy="http://10.0.0.250:80"; export HTTP_PROXY="http://10.0.0.250:80"; export HTTPS_PROXY="http://10.0.0.250:80"

# bring in any other variables
source .bashrc
