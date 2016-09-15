git init --bare $HOME/.config
alias config=/'usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
config config --local status.showUntrackedFiels no
echo "alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'"
>> $HOME/.zshrc
