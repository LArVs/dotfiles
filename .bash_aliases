[ -z "$IS_BASH_RELOAD" ] && [ -n "$IS_BASH_ALIASES" ] && return
IS_BASH_ALIASES=1

[ -n "$IS_BASH_DEBUG" ] && echo '-- alias'

# bash
alias br='IS_BASH_RELOAD=1; source ~/.bashrc; IS_BASH_RELOAD='

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias dfs='df -h -t ext4'
alias dus='du -hs'
alias dusc='du -hsS'
alias dut='du -h -d1'
alias duts='du -h -d1 | sort -hr'

alias chc='sudo chown -LR www-data: ./ ; sudo find -L ./ -type d -exec chmod 775 {} +; sudo find -L ./ -type f -exec chmod 664 {} +'
alias chas='sudo chown -LR www-data: www/assets ; sudo find -L www/assets -type d -exec chmod 775 {} +; sudo find -L www/assets -type f -exec chmod 664 {} +'

alias mcs='LANGUAGE=en_US:en mc -S xoria256'
alias mces='LANGUAGE=en_US:en mcedit -S xoria256'

alias sus="sudo -sH"
alias sshc="LC_ALL=C && ssh root@"
alias sshu="LC_ALL=en_US.utf8 && ssh"
alias sshr="LC_ALL=en_US.utf8 && ssh root@"

alias scr="screen -AadRRS"
alias scr_ls="screen -ls"
alias scr_git="scr git -c ~/.screen/git; scr_ls"

# tmux: dev
alias tmux2="tmux -2"
alias tml="tmux2 new-session -A -s LArV"
alias tm-dev="cd /tmp; tmux2 -f ~/.tmux/tmux-dev.conf -L dev"
alias tma-dev="tm-dev new-session -AD -s dev -n shell"
alias tmls-dev="tm-dev list-sessions"
alias tmkill-dev="tm-dev kill-server"
alias tmr-dev="tmkill-dev; tma-dev"
# alias sshtm="tm_kill; tma"
# tmux: repl
alias tm-repl="cd /tmp; tmux2 -f ~/.tmux/tmux-repl.conf -L repl"
alias tma-repl="tm-repl new-session -AD -s repl -n vim"
alias tmls-repl="tm-repl list-sessions"
alias tmkill-repl="tm-repl kill-server"
alias tmr-repl="tmkill-repl; tma-repl"
# tmux: videochat
alias tm-videochat="cd /tmp; tmux2 -f ~/.tmux/tmux-videochat.conf -L videochat"
alias tma-videochat="tm-videochat new-session -AD -s videochat -n shell"
alias tmkill-videochat="tm-videochat kill-server"
alias tmr-videochat="tmkill-videochat; tma-videochat"
# tmux: eloplay
alias tm-eloplay="cd /tmp; tmux2 -f ~/.tmux/tmux-eloplay.conf -L eloplay"
alias tma-eloplay="tm-eloplay new-session -AD -s eloplay -n shell"
alias tmkill-eloplay="tm-eloplay kill-server"
alias tmr-eloplay="tmkill-eloplay; tma-eloplay"

# docker
alias docker-compose-up='docker-compose kill; docker-compose rm -fa; docker-compose up --build --force-recreate'
alias docker-lsc='docker ps -a'
alias docker-lsi='docker images -a'
alias docker-rmc="docker ps -a | grep 'months ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm"
alias docker-rme='docker rm -v $(docker ps -a -q -f status=exited)'
alias docker-rmi='docker rmi $(docker images -f "dangling=true" -q)'
alias docker-rmin="docker images -a | grep '^<none>' | awk '{print $3}' | xargs --no-run-if-empty docker rmi"
alias docker-rmv='docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes'
alias docker-rmvd='docker-rmv --dry-run'
alias docker-rmall='docker-rme; docker-rmi; docker-rmv'

# power manage
alias suspend="gnome-screensaver-command --lock && dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend"
alias hibernate="gnome-screensaver-command --lock && dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Hibernate"

# update packages
alias up="apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get -y autoremove && upn"
alias ups="apt-get -u update"
alias uprr='[ -f /var/run/reboot-required ]'
alias upn='uprr && ( echo -e "\nReboot is required! \n" && notify-send -i aptdaemon-upgrade -t 10000 "Upgrade" "\nReboot is required!" )'
alias upr='up; uprr && reboot'
alias upd='up; uprr && shutdown -h now'

# net
alias ns='netstat -ltupn'
alias nsp='netstat -lantp'
alias nsm='netstat -catnup'
alias tt='tcptrack -i eth0'

# grep
#alias grep="ack-grep"
alias ack="ack-grep"

# git
alias gi='git init'
# submodule
alias gsi='git submodule init'
alias gsu='git submodule update'
alias gssy='git submodule sync'
alias gsiu='git submodule update --init'
# alias gsriu_='git submodule foreach --recursive "git submodule init; git submodule update; git submodule sync"'
alias gsriu='git submodule foreach --recursive "git submodule update --init && git submodule sync"'
# alias gsrp_='git submodule foreach --recursive "git checkout master && git pull"'
alias gsrp='git submodule foreach --recursive "git checkout master && git pull"'
alias gsrpc='git submodule foreach --recursive "git checkout master && git pull && git add . && git commit -m \"update submodule\" || return 0"'
alias gsua='gssy; gsiu; gsriu'
alias gsp='gsua; gsrp'
alias gspc='gsua; gsrpc; gp && gac && git commit -m "update submodule"'
# branch
alias gb='git branch'
alias gbnm='git branch --no-merged'
alias gbnmr='git branch --no-merged -r'
alias gbnma='git branch --all --no-merged'
alias gbd='git branch -d'
alias gbdr='git branch -dr'
alias gbdR='git push origin :'
alias gbr='git branch -r'
alias gba='git branch --all'
# branch local to remote
alias gbt='git branch --track'
# branch set upstream
alias gbu='git branch -u'
alias gbuu='git branch --unset-upstream'
alias gbur='git remote prune origin'
alias grso='git remote set-url origin'
alias grv='git remote -v'
# status
alias gs='git status -sb'
alias gss='git status'
# add
alias ga='git add'
alias gap='git add -p' # Interactively choose hunks of patch
alias gac='git add .'
alias gaa='git add -A :/'
# fetch
alias gf='git fetch'
# merge
alias gmm='git merge master'
alias gml='git merge LArV'
# merge previous
alias gmp='git merge @{-1}'
alias gmmff='git merge --ff-only --no-commit master'
# pull
alias gpe='git pull && gs'
alias gp='git pull --no-edit && gs'
alias gpa='git pull --all --prune --recurse-submodules=on-demand'
alias gpr='git pull -r || gp'
alias gpff='git pull --ff-only --no-commit'
alias gpp='gp && gsp; gs'
alias gppc='gp && gspc; gs'
alias gpf='gp && gsua; gs'
alias gprf='gpr && gsua; gs'
# pull master:previous
alias gpm='gst && gom && gpf && gop && gmm && gstp'
alias gppm='gst && gom && gppc && gop && gmm && gstp'
# push
alias gps='git push && gs'
alias gpsc='gpf && gps && gs'
# push set upstream
alias gpsup='git push -u && gs'
alias gpss='git push --recurse-submodules=on-demand && gs'
alias gpsa='git push --recurse-submodules=on-demand --all && gs'
alias gpsu='gaa && gcm "update" && gp && gpss'
alias gpsmm='git push origin master:master'
alias gpsll='git push origin LArV:LArV'
alias gpsdd='git push origin dev:dev'
# push previous:master
alias gpsm='gst && gom && gpf && gmp && gop && gmm && gpsmm && gstp'
alias gpsr='gst && gor && gmp && gp && gps && gop && gstp'
alias gpsd='gst && god && gmp && gp && gps && gop && gstp'
alias gpcd='gst && god && gmc && gp && gps && goc && gstp'
# remove cached
alias grmc='git rm -r --cached .'
# remove delete
alias grmd='gss | fgrep -i -A999 "Changes not staged for commit" | fgrep -i "delete" | cut -d: -f2 | xargs git rm'
alias grma='gss | grep -P "^\t" | cut -f2 | xargs rm -r'
# misc
alias gr='git reset'
alias gst='git stash'
alias gsta='git stash apply && gs'
alias gstp='git stash pop && gs'
alias gstl='git stash list'
alias gcl='git clone'
alias gcl1='gcl --depth 1'
alias gclr='gcl --recursive'
alias gclr1='gcl1 --recursive'
alias gc='git commit'
alias gcam='gc -am'
alias gcame='gc --edit -am'
alias gcu='gc -am "up"; gs'
alias gcsu='gc -am "update submodule"'
alias gpssu='gsp; gcsu; gpa && gpss'
alias gcm='gc -m'
alias gcamm='gc -a --amend'
alias gcmm='gc --amend'
alias gt='git tag'
alias gta='git tag -a'
alias gtam='git tag -am'
alias gtps='git push --tags'
# diff
alias gd='git diff'
alias gdc='git diff --cached'
alias gdlw='git diff HEAD "HEAD@{1 weeks ago}" --'
alias gdf='git diff --name-only'
alias gdfs='git diff --name-status'
alias gds='git diff --stat'
alias gdh='git diff HEAD~'
alias gdfh='git diff --name-only HEAD~'
alias gdfsh='git diff --name-status HEAD~'
alias gdsh='git diff --stat'
# log
alias glf='git log --pretty=format:"%h %ad | %s [%an]" --graph --date=iso'
alias glr='git log --pretty=format:"%h %ad | %s [%an]" --graph --date=relative'
alias gl='glr'
alias gls='gl --stat'
alias glss='gl --summary --stat'
alias glp='gl --patch-with-stat'
alias gla='gl --all'
alias gll='glr --author="LArV" --since="last day"'
alias glw='glr --author="LArV" --since="last week"'
# checkout
alias gch='git checkout'
alias gof='gch -f'
alias gofh='gch -f HEAD'
alias gob='gch -b'
alias gom='gch master'
alias gor='gch release'
alias gol='gch LArV'
alias god='gch dev'
alias gop='gch @{-1}'
alias go-='gch -'
# <custom branch>
alias goc='gch payment'
alias gmc='git merge payment'
# </custom branch>
alias gk='gitk --all&'
alias gx='gitx --all'

sgc() {
	echo "set alias: ${@}"
	_FILE="$HOME/.bash_aliases"
	_ALIAS1_TPL="alias goc="
		_ALIAS1="alias goc='git checkout ${@}'"
	_ALIAS2_TPL="alias gmc="
		_ALIAS2="alias gmc='git merge ${@}'"
	_ALIAS1_IS=$(grep "^$_ALIAS1_TPL" "$_FILE")
	if [ -z "$_ALIAS1_IS" ]; then
		echo "add alias"
		echo "$_ALIAS1" >> "$_FILE"
		echo "$_ALIAS2" >> "$_FILE"
	else
		echo "replace alias"
		cp "$_FILE" "${_FILE}.bak"
		cat "${_FILE}.bak" |\
			sed -r "s/^${_ALIAS1_TPL}.+$/$_ALIAS1/g" |\
			sed -r "s/^${_ALIAS2_TPL}.+$/$_ALIAS2/g" |\
		> "$_FILE"
	fi
	br
}

# svn
alias svs='svn status'
alias svp='svn update'
alias svcm='svn commit -m'
alias svcmf='svn commit -m ""'
svndiff() {
	svn diff "${@}" | colordiff
}

vimdiff() {
	svn diff "${@}" | vim - -R
}

# vim: ft=sh
