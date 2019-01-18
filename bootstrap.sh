#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# # link to the root of brew installed go
# if ! [[ -L "/usr/local/go" ]]; then
#   sudo ln -s $(dirname $(dirname $(realpath /usr/local/bin/go))) /usr/local/go;
# fi;

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;

	echo "rsync completed"

	source ~/.zshrc;
}

# if [ "$1" == "--force" -o "$1" == "-f" ]; then
# 	doIt;
# else
# 	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
# 	echo "";
# 	if [[ $REPLY =~ ^[Yy]$ ]]; then
# 		doIt;
# 	fi;
# fi;

doIt;
unset doIt;
