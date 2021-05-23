# When setting up, append the existing ~/.bashrc to ~/bashrc/bashrc,
# then add the symbolic link: sudo ln -s ~/bashrc/bashrc ~/.bashrc

## Backup commands
# rclone copy gdrive: bb2:GoogleDriveArnoKlein --drive-alternate-export
# rclone copy kak_gdrive: bb2:GoogleDriveKarenKlein --drive-alternate-export
# rclone copy ekk_gdrive: bb2:GoogleDriveElloraKlein --exclude media/** --drive-alternate-export

###########
# Aliases #
###########
# git aliases
 alias ga='git add'
 alias gco='git checkout'
 alias gcom='git checkout master'
 alias gcop='git checkout gh-pages'
 alias gs='git status'
 alias gf='git fetch origin'
 alias gd='git diff'
 alias gdiff='git diff master origin/master'
 alias gpull='git pull'
 alias gc='git commit'
 alias gp='git push'
 alias gpom='git push origin master'
 alias gpop='git push origin gh-pages'
 alias gb='git branch'
 alias gh='git --help'
 alias glola='git log --graph --decorate --pretty=oneline --abbrev-commit --name-status'

# custom aliases
 alias pp='/home/arno/Software/arno_utils/prepend_filenames $1'
 alias ss='/home/arno/Software/arno_utils/substr_filenames'
 alias ss='/home/arno/Software/arno_utils/substr_filenames'
 alias zotero='/home/arno/Software/Zotero_linux-x86_64/zotero &'
 
# ssh aliases
 alias ssha='ssh -p 7822 root@68.66.205.123' # a2
 alias sshd='ssh -x binarybottle@ps611160.dreamhostps.com' # binarybottle
 alias sshp='ssh -x pupating@ps611160.dreamhostps.com' # pupating
 alias sshc='ssh -x chefsherri@ps611160.dreamhostps.com' # chefsherri

 alias b='. /home/arno/.bashrc'
 alias eb='emacs /home/arno/.bashrc'
 alias a='alias | more'  
 alias cr='cp -R'
 alias md='mkdir $1'
 alias h='history'
 alias m='more'
 alias p='pwd'
 alias r='rm *#* .*#* *~ .*~ core .DS_Store *.pyc crash-* .directory'
 alias rrf='rm -rf'
 alias rsyncecho='echo "rsync -avz --sparse --exclude-from=/home/arno/.rsync-exclude -e /usr/bin/ssh <in> ."'
 alias lunch='bundle exec jekyll serve'

# cd aliases
 alias d='cd $1'
 alias da='cd /home/arno/Data'
 alias de='cd /home/arno/Desktop'
 alias do='cd /home/arno/Documents'
 alias dw='cd /home/arno/Downloads'
 alias ds='cd /home/arno/Software'
 alias dr='cd /home/arno/Drive'

# ls aliases
 alias t='ls $1'
 alias tr='ls -RFg $1'
 alias ta='ls -AFg $1'
 alias tm='ls -Fg $1 | more'
 alias tam='ls -AFg $1 | more'
 alias tt='ls -ltFg $1'
 alias ttr='ls -lrtFg $1'
 alias tta='ls -lAFg $1'
 alias ttm='ls -lFg $1 | more'
 alias ttam='ls -lAFg $1 | more'
 alias td='ls -bag'
 alias tdd='ls .[a-zA-Z0-9_]*'
 alias du='du -hs *'

#########
# PATHS #
#########
#export PATH=

####################
# ORIGINAL .BASHRC #
####################

#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/arno/Software/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/arno/Software/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/arno/Software/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/arno/Software/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<




