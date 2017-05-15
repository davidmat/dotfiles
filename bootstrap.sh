#!/usr/bin/env bash
# Copyright Mathias Bynens <https://mathiasbynens.be/>

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
	rsync \
		--exclude ".git/" \
		--exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "Brewfile" \
		--exclude "bootstrap.sh" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
        brew bundle;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
