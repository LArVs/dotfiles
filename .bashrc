# DEBUG
 # IS_BASH_DEBUG=1

[ -n "$IS_BASH_DEBUG" ] && echo '-- rc'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[ -z "$IS_BASH_RELOAD" ] && [ -n "$IS_BASH_RC" ] && return
IS_BASH_RC=1

# bash lib
. ~/.bash_lib

# env: HOME
if [ -z "$HOME" ]; then
	HOME=$( _readlink ~ )
	_echo -e "\t-- home: '$HOME'"
fi


# load bash modules
_loads \
	~/.bash_profile \
	~/.bash_aliases \

if ! shopt -oq posix; then
	_load /etc/bash_completion BASH_C_E
fi


if [ -n "$(brew --prefix)" ]; then
	_load $(brew --prefix)/etc/bash_completion BASH_C_B
fi

##### ruby
# rvm global
_load /etc/profile.d/rvm.sh RVM
# rvm local
# PATH=$PATH:$HOME/.rvm/bin
# _load "$HOME/.rvm/scripts/rvm"

# node version manager
__export NVM_DIR $HOME/.nvm
# _load $NVM_DIR/nvm.sh NVM
_loads $NVM_DIR/nvm.sh

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
