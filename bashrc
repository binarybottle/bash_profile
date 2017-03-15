# First append the existing ~/.bashrc to ~/bashrc/bashrc,
# then add a symbolic link:
# sudo ln -s ~/.bash_profile ~/bashrc/bashrc

# This file assumes the following symbolic links to directories
# within /homedir in Linux (/home/arno) or macOS (/Users/arno):
# sudo ln -s /[home,Users]/arno /homedir
# sudo ln -s /homedir/Data /data            # /homedir/Data
# sudo ln -s /homedir/Desktop /desk         # /homedir/Desktop
# sudo ln -s /homedir/Documents /docs       # /homedir/Documents
# sudo ln -s /homedir/Downloads /downloads  # /homedir/Downloads
# sudo ln -s /homedir/Drive /drive          # /homedir/Drive
# sudo ln -s /homedir/Software /software    # /homedir/Software

###########
# Aliases #
###########
# Aliases -- local paths:
 alias b='. /homedir/bash_profile/bash_profile'
 alias eb='emacs /homedir/bash_profile/bash_profile'
 alias d='cd $1'
 alias da='cd /data'
 alias dk='cd /desk'
 alias dc='cd /docs'
 alias do='cd /downloads'
 alias dv='cd /drive'
 alias ds='cd /software'
 alias pp='/software/arno_utils/prepend_filenames $1'
 alias ss='/software/arno_utils/substr_filenames'
 alias mogrify='/opt/ImageMagick/bin/mogrify'
 alias dmote='sudo /software/droidmote-server-linux-x64-v3.0.2/droidmote 2302 mutedroid'

# Aliases -- remote:
 alias sshd='ssh -x binarybottle@binarybottle.com' # binarybottle
 alias sshn='ssh arno@ned.childmind.org'
 alias sshp='ssh -x pupating@pupating.org' # pupating
 alias sshb='ssh -p 22 arno@boggler4' # boggler4
 alias sshm='ssh -p 22 arno@mindboggler' # mindboggler
 alias sshftpmindboggle='ssh ftpmindboggle@binarybottle.com' # binarybottle
 alias sshaws='ssh -i "/homedir/.aws/binarybottle-aws-ssh-key.pem" ubuntu@ec2-54-146-136-218.compute-1.amazonaws.com'

# Aliases -- rsync to home:
 alias rsyncecho='echo "rsync -avz --sparse --exclude-from=/homedir/.rsync-exclude -e /usr/bin/ssh <in> ."'
 alias rsyncecho2='echo "rsync -avz --delete --sparse --exclude-from=/homedir/.rsync-exclude -e /usr/bin/ssh <in> ."'

# Aliases -- Git:
 alias ga='git add'
 alias gco='git checkout'
 alias gcom='git checkout master'
 alias gcop='git checkout gh-pages'
 alias gc='git commit'
 alias gp='git push'
 alias gpom='git push origin master'
 alias gpop='git push origin gh-pages'
 alias gpull='git pull'
 alias gb='git branch'
 alias gh='git --help'
 alias gs='git status'
 alias gd='git diff'
 alias glola='git log --graph --decorate --pretty=oneline --abbrev-commit --name-status'

# Aliases -- list:
 alias t='ls $1'
 alias ta='ls -A $1'
 alias tm='ls $1 | more'
 alias tam='ls -A $1 | more'
 alias tt='ls -lart $1'
 alias tta='ls -lA $1'
 alias ttm='ls -l $1 | more'
 alias ttam='ls -lA $1 | more'
 alias td='ls -ba'
 alias tdd='ls .[a-zA-Z0-9_]*'
 alias du='du -hs *'

# Aliases -- common:
 alias a='alias | more'  
 alias cr='cp -R'
 alias md='mkdir $1'
 alias h='history'
 alias m='more'
 alias p='pwd'
 alias r='rm *#* .*#* *~ .*~ core .DS_Store *.pyc crash-* .directory'
 alias rrf='rm -rf'

#########
# PATHS #
#########

# added by Anaconda3 3.5 installer
export PATH="/anaconda/bin:$PATH"

# Mindboggle
#export vtk_cpp_tools=/software/install/mindboggle/vtk_cpp_tools/bin
#export PATH=/software/install/mindboggle/vtk_cpp_tools/bin:$PATH


####################
# ORIGINAL .BASHRC #
####################

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# added by Anaconda3 4.3.0 installer
export PATH="/home/arnoklein/anaconda3/bin:$PATH"