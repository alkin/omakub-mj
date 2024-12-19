# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.l log
git config --global alias.pl pull
git config --global alias.ps push
git config --global alias.ft fetch
git config --global alias.d diff
git config --global alias.a add
# git config --global pull.rebase true

git config --global user.email "$OMAKUB_FIRST_RUN_EMAIL"
git config --global user.name "$OMAKUB_FIRST_RUN_NAME"
git config --global pull.rebase false
