# Bash Customisations
# -------------------

# Enable Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

## prompt
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

## $EDITOR
if [[ -n $SSH_CONNECTION ]]; then
   export VISUAL='vi';
   export EDITOR=$VISUAL;
else
  export VISUAL='vim';
  export EDITOR=$VISUAL;
fi;
alias edit='vim';

## HISTORY
export HISTCONTROL=erasedups;
export HISTSIZE=-1;
export HISTFILESIZE=-1;

## File Browser
alias finder='open -a Finder ./';

## Common tool aliases
alias ll='ls -lah';

## Vagrant
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion;
export VAGRANT_VMWARE_CLONE_DIRECTORY="/Users/dmat/Virtual Machines/vagrant";

## Tab completion
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion;
fi
