#!/usr/bin/env bash

# Bash Customisations
# 1. Requires bash v4
# 2. Assumes bash-completion

# Source in additional files
for file in ~/.{bash_prompt,bash_aliases,bash_functions,bash_exports,docker_functions,secrets}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done
unset file

## Shell Options
for option in autocd globstar nocaseglob histappend cdspell; do
	shopt -s "$option";
done;
## `autocd`: directory is executed as if it were the argument to the cd command
## `globstar`: `**` recursive globbing
## `nocaseglob`: Case-insensitive globbing (used in pathname expansion)
## `histappend`: Append to the Bash history file, rather than overwriting it
## `cdspell`: Autocorrect typos in path names when using `cd`

## Completion
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi
