cp ./.tmux.conf ~/
cp ./.zshrc ~/

cp ./zweix.zsh-theme ~/.oh-my-zsh/themes/

cp ./.vimrc ~/

cd ~
rm -rf .vim
git clone --recursive git@github.com:zweix123/.vim.git
