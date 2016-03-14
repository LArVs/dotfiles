# DEBUG
# IS_BASH_DEBUG=1

[ -n "$IS_BASH_DEBUG" ] && echo '-- rc'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[ -z "$IS_BASH_RELOAD" ] && [ -n "$IS_BASH_RC" ] && return
IS_BASH_RC=1

# bash lib
. ~/.bash_lib

HOME=$( readlink -f ~ )
_echo -e "\t-- home: '$HOME'"

# load bash modules
_loads \
	~/.bash_profile \
	~/.bash_aliases \

if ! shopt -oq posix; then
	_load /etc/bash_completion
fi


if [ -n "$(brew --prefix)" ]; then
	_load $(brew --prefix)/etc/bash_completion
fi

##### ruby
# rvm global
_load /etc/profile.d/rvm.sh RVM
# rvm local
# PATH=$PATH:$HOME/.rvm/bin
# _load "$HOME/.rvm/scripts/rvm"

# node version manager
_export NVM_DIR $HOME/.nvm
_load $NVM_DIR/nvm.sh

