CURRENT_FOLDER=$(cd "$(dirname "$0")";pwd)
cd $CURRENT_FOLDER

cp ~/.tmux.conf ./
cp ~/.zshrc ./

cp ~/.oh-my-zsh/themes/zweix.zsh-theme ./

cp ~/.vimrc ./
