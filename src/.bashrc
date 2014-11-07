# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Set default umask
umask 022

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
bash_prompt_command() {
	# How many characters of the $PWD should be kept
	local pwdmaxlen=20

	# Indicate that there has been dir truncation
	local trunc_symbol=".."
	local dir=${PWD##*/}
	pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
	NEW_PWD=${PWD/$HOME/~}
	local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))

	if [ ${pwdoffset} -gt "0" ]
		then
			NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
	        	NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
		fi
}

bash_prompt() {
	local NONE='\[\033[0m\]'    # unsets color to term's fg color 

	# regular colors
	local K='\[\033[0;30m\]'    # black
	local R='\[\033[0;31m\]'    # red
	local G='\[\033[0;32m\]'    # green
	local Y='\[\033[0;33m\]'    # yellow
	local B='\[\033[0;34m\]'    # blue
	local M='\[\033[0;35m\]'    # magenta
	local C='\[\033[0;36m\]'    # cyan
	local W='\[\033[0;37m\]'    # white

	# empahsized (bolded) colors 
	local EMK='\[\033[1;30m\]' 
	local EMR='\[\033[1;31m\]' 
	local EMG='\[\033[1;32m\]' 
	local EMY='\[\033[1;33m\]' 
	local EMB='\[\033[1;34m\]' 
	local EMM='\[\033[1;35m\]' 
	local EMC='\[\033[1;36m\]' 
	local EMW='\[\033[1;37m\]' 

	# background colors
	local BGK='\[\033[40m\]' 
	local BGR='\[\033[41m\]'
	local BGG='\[\033[42m\]'
	local BGY='\[\033[43m\]'
	local BGB='\[\033[44m\]'
	local BGM='\[\033[45m\]'
	local BGC='\[\033[46m\]'
	local BGW='\[\033[47m\]'

	local UC=$C                 # user's color
	[ $UID -eq "0" ] && UC=$R   # root's color 
	#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"' 
	#PS1="${EMK}[${UC}\u${EMR}@${UC}\h ${EMB}\${NEW_PWD}${EMK}]${UC}\\$ ${NONE}" 
	#PS1="${W}[\t${W}] ${Y}[${R}\u${R}@${R}\h ${EMB}\${NEW_PWD}${Y}]${W}\\$ ${NONE}" 
	PS1="${Y}[${R}\u${R}@${R}\h ${W}\t${W} ${EMB}\${NEW_PWD}${Y}]${G}\\$ ${NONE}"

	# ctrl-c fix re: http://jonisalonen.com/2012/your-bash-prompt-needs-this/
	PS1="\[\033[G\]$PS1" 
}

PROMPT_COMMAND=bash_prompt_command 
bash_prompt
unset bash_prompt

# This loads RVM into a shell session.
[[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm"  
