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

# net
alias ns='netstat -ltupn'
alias nsp='netstat -lantp'
alias nsm='netstat -catnup'
alias tt='tcptrack -i eth0'

# git
alias gi='git init'
# submodule
alias gsi='git submodule init'
alias gsu='git submodule update'
alias gssy='git submodule sync'
alias gsiu='git submodule update --init'
# status
alias gs='git status -sb'
alias gss='git status'
# add
alias ga='git add'
alias gap='git add -p' # Interactively choose hunks of patch
alias gac='git add .'
alias gaa='git add -A :/'
# merge
alias gmm='git merge master'
# pull
alias gpe='git pull && gs'
alias gp='git pull --no-edit && gs'
alias gpa='git pull --all --prune --recurse-submodules=on-demand'
alias gpr='git pull -r || gp'
# push set upstream
alias gpsup='git push -u && gs'
alias gpss='git push --recurse-submodules=on-demand && gs'
alias gpsa='git push --recurse-submodules=on-demand --all && gs'
alias gpsu='gaa && gcm "update" && gp && gpss'
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
# checkout
alias gch='git checkout'
alias gof='gch -f'
alias gofh='gch -f HEAD'
alias gob='gch -b'
alias gom='gch master'
alias gop='gch @{-1}'
alias go-='gch -'

