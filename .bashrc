#Detect the platform we are running on for some platform-specific stuff.
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == "Linux" ]]; then
  platform='linux'
elif [[ "$unamestr" == "Darwin" ]]; then
  platform='freebsd'
fi

# golang env vars setup
export GOPATH=~/golang
export GOROOT=$GOPATH/go
export GOBIN=$GOPATH/bin

# add GOBIN to path
export PATH=$GOBIN:$PATH
export PATH=$GOROOT/bin:$PATH

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# add homebrew python path
export PATH=/usr/local/share/python:$PATH

if [[ "$platform" == 'freebsd' ]]; then
  export EDITOR=mvim
else
  export EDITOR=vim
fi
export GNUTERM='x11'
export NODE_PATH=/usr/local/lib/node_modules:/usr/local/lib/node:$NODE_PATH

# Use local ackrc files if they exist
export ACKRC=".ackrc"



# Aliases for awesomeness
alias ll="ls -alh"
alias ls="ls -G" # colors in ls
alias pp='python -mjson.tool' #json pretty printing

# tmux alias to make sure it supports 256 colors
alias tmux="TERM=screen-256color tmux"


# bash completion
if [[ "$platform" == 'freebsd' ]]; then
  if [[ -f `brew --prefix`/etc/bash_completion ]]; then source `brew --prefix`/etc/bash_completion; fi # for Git completion
elif [[ "$platform" == 'linux' ]]; then
  if [[ -e "/etc/bash_completion.d/git" ]]; then
    source /etc/bash_completion.d/git
  fi
fi

export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]ಠ_ಠ\[\e[0m\]; fi\` \[\033[01;34m\] \[\033[01;32m\]\w\[\033[00;33m\]\$(__git_ps1 \" (%s)\") \[\033[01;36m\]λ\[\033[00m\] "

# rbenv setup
if [[ -r /usr/local/bin/rbenv ]]; then
  eval "$(rbenv init -)"
fi

set keymap vi
set -o vi

# nvm setup
NVMPATH=~/.nvm/nvm.sh
if [[ -r $NVMPATH ]]; then
  source $NVMPATH
fi

# for badoop (https://github.com/jergason/badoop)
export TODO=~/Dropbox/todo.txt

#Optionally include a .bashrc.local for some local stuff
if [[ -f ~/.bashrc.local ]]; then
  source ~/.bashrc.local
fi
