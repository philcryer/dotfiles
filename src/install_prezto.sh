echo "Prezto — Instantly Awesome Zsh"
echo "https://github.com/sorin-ionescu/prezto"
echo "---------------------------------------"

cd ~
mkdir .zsh-old
mv .z* oh-my* .zsh-old

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh

echo "close terminal and reopen to use prezto"

exit 0
