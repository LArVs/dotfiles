# echo 'start: profile'

export EDITOR=/usr/local/bin/vim

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# export PATH="/usr/local/bin:$PATH"
_PATH="/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin"
export PATH="$_PATH:$PATH"

_MANPATH="/usr/local/opt/coreutils/libexec/gnuman"
export MANPATH="$_MANPATH:$MANPATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color
# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

_file=~/.bash_aliases
if [ -f "$_file" ]; then . "$_file"; fi

function git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[git:\1]/';
}


function git_status {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && tput setaf 1 || tput setaf 3
}

export PS1="\u@\h \w \[\$(git_status)\]\$(git_branch)\[\$(tput sgr 0)\] $ "

_file=$(brew --prefix)/etc/bash_completion
if [ -f "$_file" ]; then . "$_file"; fi

_file=/etc/profile.d/rvm.sh
if [ -f "$_file" ]; then . "$_file"; fi

