# DEBUG
# IS_BASH_DEBUG=1

[ -n "$IS_BASH_DEBUG" ] && echo '-- rc'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[ -z "$IS_BASH_RELOAD" ] && [ -n "$IS_BASH_RC" ] && return
IS_BASH_RC=1

# load script
function _echo {
	if [ $# > 1 ]; then _option=$1; shift; fi
	[ -n "$IS_BASH_DEBUG" ] && echo $_option "$@"
}

# set export
function _export {
	local _name=$1 _value=$2;
	[ -n "$IS_BASH_DEBUG" ] && _echo -ne "\t-- export: '$_value'"
	if [ -d "$_value" ]; then
		_echo " - ok"
		export $_name="$_value";
	else
		_echo " - fail"
	fi
}

declare -A IS_LOAD
function _load {
	local _item=$1 _name=$2 _is=
	[ -n "$_name" ] && _is=IS_${_name}_LOAD
	[ -n "$IS_BASH_DEBUG" ] && _echo -en "\t-- load: '$_item' '$_name' $_is: '${!_is}'"
	if [ -z "${!_is}" ]; then
		if [ -s "$_item" ]; then
			_echo " - ok"
			[ -n "$_name" ] && eval export $_is=1
			. "$_item";
		else
			_echo " - fail"
		fi
	else
		_echo " - already"
	fi
}
function _loads {
	local _item=$@ _i;
	for _i in $_item; do _load $_i; done
}

# set path
function _path {
	local _item=$1;
	[ -n "$IS_BASH_DEBUG" ] && echo -ne "\t-- path: '$_item'"
	if [ -d "$_item" ]; then
		_echo " - ok"
		_PATH=$_PATH:$_item;
	else
		_echo " - fail"
	fi
}
function _paths {
	local _item=$@ _i;
	for _i in $_item; do _path $_i; done
}

# load bash modules
_loads \
	~/.bash_profile \
	~/.bash_aliases \

_file=~/.bash_aliases; if [ -f "$_file" ]; then . "$_file"; fi
_file=~/.bash_profile; if [ -f "$_file" ]; then . "$_file"; fi

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

