cp ./.tmux.conf ~/
cp ./.zshrc ~/

cp ./zweix.zsh-theme ~/.oh-my-zsh/themes/

cp ./.vimrc ~/

cp -r ./pip ~/.config/

cd ~
rm -rf .vim
mkdir .vim
cd .vim
mkdir colors
git clone https://github.com/morhetz/gruvbox.git
mv gruvbox/colors/gruvbox.vim ./colors/gruvbox.vim
