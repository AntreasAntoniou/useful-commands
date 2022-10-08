apt install micro bat git tmux fish

curl -sS https://starship.rs/install.sh | sh
eval "$(starship init bash)"
starship init fish | source

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
