if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
#if [ -f ~/.zshrc ]; then
#  . ~/.zshrc
#fi

if [ -f ~/.gitrc ]; then
  . ~/.gitrc
fi

# Add any path vars here
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/lib/gems/1.8/bin/

if [ -d ~/bin/ ]; then
   PATH=$PATH:~/bin/
fi

alias ports='lsof -nPi | grep LIST | awk '\''{printf "%-20s%-5s%-5s%s\n",$1,$5,$7,$8}'\'' | sort | uniq'

EDITOR=vim.nox

mesg n
