# DEBUG
# IS_BASH_DEBUG=1

[ -n "$IS_BASH_DEBUG" ] && echo '-- profile'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[ -z "$IS_BASH_RELOAD" ] && [ -n "$IS_BASH_PROFILE" ] && return
IS_BASH_PROFILE=1

# load rc
if [ -z "$IS_BASH_RC" ] && [ -s ~/.bashrc ]; then . ~/.bashrc; fi

# export LC_ALL=C
#
# export LC_ALL=ru_UA.UTF-8
# export LANGUAGE=ru:en
#
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US:en

export TERM=xterm-256color

export EDITOR="vim -n"
export VISUAL="vim -n"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

##### history
# history length
HISTSIZE=9999
HISTFILESIZE=9999

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace:erasedups:ignoreboth

# don't save in history next commands (for mc)
HISTIGNORE="&:ls:[bf]g:exit: cd \"\'*: PROMPT_COMMAND='*"

# append to the history file, don't overwrite it
shopt -s histappend

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# export PATH="/usr/local/bin:$PATH"
_PATH="/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin"
export PATH="$_PATH:$PATH"

_MANPATH="/usr/local/opt/coreutils/libexec/gnuman"
export MANPATH="$_MANPATH:$MANPATH"

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

function git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[git:\1]/';
}
function git_status {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && tput setaf 1 || tput setaf 2
}

export PS1="\u@\h \w \[\$(git_status)\]\$(git_branch)\[\$(tput sgr 0)\] $ "

