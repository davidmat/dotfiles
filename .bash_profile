#!/usr/bin/env bash

# Bash Customisations
# 1. Requires bash v4
# 2. Assumes bash-completion

## Enable Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

## Prompt
PROMPT_USER_COLOR="$(tput setaf 4)"; # Blue
PROMPT_HOST_COLOR="$(tput setaf 2)"; # Green
PROMPT_DIR_COLOR="$(tput setaf 3)"; # Yellow
PROMPT_NEUTRAL_COLOR="$(tput setaf 7)"; # WHITE

PS1="\[$PROMPT_USER_COLOR\]\u"; #username
PS1+="\[$PROMPT_NEUTRAL_COLOR\] at ";
PS1+="\[$PROMPT_HOST_COLOR\]\h"; #hostname
PS1+="\[$PROMPT_NEUTRAL_COLOR\] in ";
PS1+="\[$PROMPT_DIR_COLOR\]\W"; #working dir
PS1+="\[$PROMPT_NEUTRAL_COLOR\] \$ ";
export PS1;

PS2="=> ";
export PS2;

## Editor
if [[ -n $SSH_CONNECTION ]]; then
   export VISUAL='vi';
   export EDITOR=$VISUAL;
else
  export VISUAL='vim';
  export EDITOR=$VISUAL;
fi;

## History
export HISTCONTROL=erasedups;
export HISTSIZE=-1;
export HISTFILESIZE=-1;

## Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## Shell Options
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
