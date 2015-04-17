echo "Prezto — Instantly Awesome Zsh"
echo "https://github.com/sorin-ionescu/prezto"
echo "---------------------------------------"

cd ~
mkdir .zsh-old
mv .z* oh-my* .zsh-old

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -s .zprezto/runcoms/zlogin .zlogin
ln -s .zprezto/runcoms/zlogout .zlogout
ln -s .zprezto/runcoms/zpreztorc .zpreztorc
ln -s .zprezto/runcoms/zprofile .zprofile
ln -s .zprezto/runcoms/zshenv .zshenv
ln -s .zprezto/runcoms/zshrc .zshrc

chsh -s /bin/zsh

echo "close terminal and reopen to use prezto"

exit 0
