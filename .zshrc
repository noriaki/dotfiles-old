#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors

#
# http://www.cozmixng.org/~kou/linux/zsh
#
# Emacs style key binding
bindkey -e

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

function history-all { history -E 1 }

autoload -U colors
colors

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt no_flow_control
setopt no_clobber
setopt no_beep
setopt auto_list
setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob
setopt hist_expand
setopt pushd_to_home

cdpath=($HOME)

setopt no_tify
setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify

limit coredumpsize 0

### set alias
alias rr="rm -rf"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

alias pd="pushd"
alias po="popd"

alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'

alias la="ls -lhAF --color=auto"
alias ll="ls -lhF --color=auto"
alias cl="make -f ~/Makefile clean"
alias ps="ps -fU`whoami` --forest"

alias e="emacs &"
alias enw="emacs -nw"

alias -g L='| lv -c'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'

#alias sudo="env PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin \sudo"
alias sudo="sudo -E "

#
# http://www.jmuk.org/diary/2007/02/23/2
#
PROMPTTTY=`tty | sed -e 's/^\/dev\///'`
PROMPT="[%B${cyan}%~${default}%b] <%B${PROMPTTTY}%b> %E
%b%# "
if [ `whoami` = root ]; then
        RPROMPT="${red}%B%n${default}%b@${logreen}%m${default}%b"
else
        RPROMPT="${loyellow}%n${default}%b@${logreen}%m${default}%b"
fi
SPROMPT="${red}Correct ${default}> '%r' [%BY%bes %BN%bo %BA%bbort %BE%bdit] ? "

alias h='history 1'
alias j='jobs'
alias cp='nocorrect cp -i'

#
# own
#
export LANG=ja_JP.UTF-8
export EDITOR=emacs
export GIT_EDITOR=emacs
export GIT_PAGER=less
alias gemi="gem i --no-ri --no-rdoc --verbose --both"
alias restart_rails="touch tmp/restart.txt"
alias less="less -R"
alias tail="tail -n 100 -F"

setopt list_types
setopt auto_param_keys
setopt auto_param_slash
setopt auto_cd
setopt no_flow_control

#  http://d.hatena.ne.jp/takahumi10/20091023
zstyle ':completion:*' list-colors ''
setopt magic_equal_subst
alias ls='ls --color=auto'
alias sl='ls'

#  http://d.hatena.ne.jp/f99aq/20090418/1240067145
#  http://www.reddit.com/r/programming/comments/6vu4e/ask_reddit_any_zsh_users_here_what_are_your/c050gh2
rationalise-dot() {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

# svn
export SVN_EDITOR=emacs

# GNU screen
#  http://d.hatena.ne.jp/f99aq/20070125/1169722215
if [ "$TERM" = "screen-bce" ]; then
  preexec() {
    # see [zsh-workers:13180]
    # http://www.zsh.org/mla/workers/2000/msg03993.html
    emulate -L zsh
    local -a cmd; cmd=(${(z)2})
    echo -ne "\ek$cmd[1]:t\e\\"
  }

  precmd() { echo -ne "\ek[`basename $PWD`]\e\\" }
fi

# for cd
function chpwd()
{
    ls;
}

#  http://www.gentei.org/~yuuji/rec/pc/intro-screen.html
#title () {echo -n "\e]0;$*\a"}

# SUN Java
#  http://codezine.jp/article/detail/3325?p=2
#export JAVA_HOME=/home/noriaki/java/jre1.6.0_14
#export EC2_HOME=/home/noriaki/amazon/ec2-api-tools
#export AMAZON_ELASTIC_MAPREDUCE=/home/noriaki/amazon/elastic-mapreduce-ruby
#export PYTHON_HOME=/usr/local/python
#export PATH=$PYTHON_HOME/bin:$PATH:$JAVA_HOME/bin:$EC2_HOME/bin:$AMAZON_ELASTIC_MAPREDUCE
#export EC2_PRIVATE_KEY=/home/noriaki/amazon/.keys/pk-JXEMZKQULED4HJA2FQD5S4WQIS5NFSJK.pem
#export EC2_CERT=/home/noriaki/amazon/.keys/cert-JXEMZKQULED4HJA2FQD5S4WQIS5NFSJK.pem

# OpenCV
#  http://d.hatena.ne.jp/visual-photo-search/20100419/1271691039
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

# RVM
#  http://d.hatena.ne.jp/ruedap/20110112/ruby_version_manager_rvm_install
source "$HOME/.rvm/scripts/rvm"
source ~/.profile

# nodebrew
#  http://d.hatena.ne.jp/Jxck/20120224/1330035058
export PATH=$HOME/.nodebrew/current/bin:$PATH

### end of file



PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
