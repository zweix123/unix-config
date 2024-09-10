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
cd colors
curl -o gruvbox.vim https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
